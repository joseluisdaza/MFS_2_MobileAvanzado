import 'dart:isolate';

import 'package:demo/llamadas_isolates/modelo.dart';
import 'package:flutter/material.dart';

//Ejemplo de llamadas entre isolates
//Agregar la clase perfecto

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController tedNumero = TextEditingController();
  double x = -1, y = 0;

  List<int> listaPerfectos = [];
  bool estaCorriendo = false;

  //Objetos de las clases importantes en los isolates
  SendPort? workerPort;
  ReceivePort? replyPort;
  Isolate? isolate;

  //Para que nos saque mensajes en la parte inferior
  void snack(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje), duration: Duration(milliseconds: 800)),
    );
  }

  //PAra que no quede nada abierto cuando se termine la labor.
  @override
  void dispose() {
    replyPort?.close();
    workerPort = null;
    isolate?.kill();
    tedNumero.dispose();

    super.dispose();
  }

  Future<void> inicio() async {
    //Controllar riesgos de comunicación errada
    if (workerPort == null || estaCorriendo == true) {
      return;
    }

    int n = int.parse(tedNumero.text.toString());
    if (n == null || n < 1) {
      snack('Ingresa un n[umero natural');
      return;
    }

    replyPort?.close();
    replyPort = ReceivePort();
    listaPerfectos = [];
    setState(() {
      estaCorriendo = true;
    });

    workerPort?.send({'cmd': 'start', 'reply': replyPort?.sendPort, 'n': n});

    //ahora tenemos que escuchar los mensajes que nos estan mandando del otro lado.
    replyPort?.listen((msg) {
      final map = msg as Map;
      switch (map['type']) {
        case 'progress':
          setState(() {
            listaPerfectos.add(map['value']);
          });
          break;
        case 'done':
          replyPort?.close();
          setState(() {
            estaCorriendo = false;
          });
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3), () {
      setState(() {
        x = 1;
      });
    });
    spanWorker();
  }

  Future spanWorker() async {
    final ready = ReceivePort();
    //entablar la conexion del primer mensaje.
    // isolate = await ready.first as SendPort;
    isolate = await Isolate.spawn(isolateNumPerWorker, ready.sendPort);
    workerPort = await ready.first as SendPort;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Isolate')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(children: [data(), boton()]),
            animado(),
            listado(),
          ],
        ),
      ),
    );
  }

  Widget listado() {
    return Expanded(
      child: Card(
        child: ListView.builder(
          itemCount: listaPerfectos.length,
          itemBuilder: (context, index) {
            return Text(
              '(${index + 1}) -> ${listaPerfectos[index]}',
              style: TextStyle(fontSize: 25),
            );
          },
        ),
      ),
    );
  }

  Widget data() {
    return Expanded(
      child: TextField(
        controller: tedNumero,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Ingresa número',
        ),
      ),
    );
  }

  Widget boton() {
    inicio();
    return ElevatedButton(onPressed: () {}, child: Text('Inicio'));
  }

  Widget animado() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: AnimatedAlign(
        alignment: Alignment(x, y),
        onEnd: () {
          setState(() {
            if (x == 1) {
              x = -1;
            } else {
              x = 1;
            }
          });
        },
        duration: Duration(milliseconds: 1000),
        child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(border: Border.all()),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

//Desarrollar el momento en el isolae secundario
//Son funciones top level.
void isolateNumPerWorker(SendPort mainSendPort) {
  final inbox = ReceivePort();
  mainSendPort.send(inbox.sendPort);

  inbox.listen((msg) {
    final m = msg as Map;
    if (m['cmd'] == 'start') {
      //El Reply es el medio para responder a la solicitud
      final reply = m['reply'] as SendPort;

      int n = m['n'] as int;
      int p = 6;
      while (n > 0) {
        Perfecto obj = Perfecto(p);
        if (obj.esPerfecto()) {
          reply.send({'type': 'progress', 'value': p});
          n--;
        }
        p++;
      }

      //avisamos al otro lado que ya hemos terminado
      reply.send({'cmd': 'done'});
    }
  });
}

//Desarrollar el momento en el isolate principal
