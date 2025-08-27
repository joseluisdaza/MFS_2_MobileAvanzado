import 'dart:isolate';

import 'package:demo/llamadas_isolates/modelo.dart';
import 'package:flutter/material.dart';

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
  SendPort? workerPort;
  ReceivePort? replyPort;
  Isolate? isolate;

  void snack(msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
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
    //isolate = await ready.first as SendPort;
    isolate = await Isolate.spawn(isolateNumPerWorker, ready.sendPort);
    workerPort = await ready.first as SendPort;
  }

  @override
  void dispose() {
    replyPort?.close();
    workerPort = null;
    isolate?.kill();
    tedNumero.dispose();
    super.dispose();
  }

  Future<void> inicio() async {
    if (workerPort == null || estaCorriendo == true) {
      return;
    }
    int n = int.parse(tedNumero.text.toString());
    if (n == null || n < 1) {
      snack('Ingresa un número natural');
      return;
    }

    replyPort?.close();
    replyPort = ReceivePort();
    listaPerfectos = [];
    setState(() {
      estaCorriendo = true;
    });

    workerPort?.send({'cmd': 'start', 'reply': replyPort?.sendPort, 'n': n});
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

  Future<void> cancelar() async {
    if (!estaCorriendo) return;

    replyPort?.close(); // cierro el canal
    replyPort = null;
    isolate?.kill();
    isolate = null;
    workerPort = null;

    setState(() {
      estaCorriendo = false;
      listaPerfectos.clear();
      tedNumero.clear();
    });

    await spanWorker(); // nuevo worker

    snack('Cancelado');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(title: Text('Isolate')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(children: [data(), boton(), cancelButton()]),
            animado(),
            listado(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tedNumero.clear();
          listaPerfectos.clear();
          estaCorriendo = false;
        },
      ),
    );
  }

  Widget listado() {
    return Expanded(
      child: Card(
        child: ListView.builder(
          itemCount: listaPerfectos.length,
          itemBuilder: (context, index) {
            return Text('(${index + 1} ) -> ${listaPerfectos[index]}  ');
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
    return ElevatedButton(
      onPressed: () {
        inicio();
      },
      child: Text('Inicio'),
    );
  }

  Widget cancelButton() {
    return ElevatedButton(
      onPressed: () {
        cancelar();
      },
      child: Text('CANCELAR'),
    );
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

// función top level
void isolateNumPerWorker(SendPort mainSendPort) {
  final inbox = ReceivePort();
  mainSendPort.send(inbox.sendPort);

  inbox.listen((msg) {
    final m = msg as Map;
    if (m['cmd'] == 'start') {
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
      reply.send({'cmd': 'done'});
    }
  });
}
