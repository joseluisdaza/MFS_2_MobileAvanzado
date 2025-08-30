import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController tedNumero = TextEditingController();
  double x = -1, y = 0;

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
          ],
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
