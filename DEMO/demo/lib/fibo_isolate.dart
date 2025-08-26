import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController tedNumero = TextEditingController();
  double x = -1, y = 0;
  String resultado = '';

  //llamada al compute para poder llamar al isolate
  void isolateCompute(int n) async {
    int f = await compute(fibo, n);
    resultado = 'Fibo: $f';
    // setState(() {});
  }

  static int fibo(int n) {
    if (n <= 1) {
      return n;
    } else {
      return fibo(n - 1) + fibo(n - 2);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3), () {
      setState(() {
        x = 1;
      });
    });
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
            salida(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            tedNumero.clear();
            resultado = '';
          });
        },
      ),
    );
  }

  Widget salida() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(resultado, style: TextStyle(fontSize: 25)),
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
        int n = int.parse(tedNumero.text.toString());
        isolateCompute(n);
      },
      child: Text('Inicio'),
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
