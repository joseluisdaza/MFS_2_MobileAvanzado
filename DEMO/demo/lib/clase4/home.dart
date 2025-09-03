import 'dart:ffi';

import 'package:demo/clase4/graficos/accion.dart';
import 'package:demo/clase4/graficos/accion2.dart';
import 'package:demo/clase4/graficos/cuadro_dos.dart';
import 'package:demo/clase4/graficos/cuadro_uno.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.addListener(() {
      setState(() {
        _controller.value;
      });
    });

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla responsive"),
        backgroundColor: Colors.red,
      ),

      body: LayoutBuilder(
        builder: (context, constraint) {
          final double w = constraint.maxWidth;
          final double h = constraint.maxHeight;

          //Una forma de determinar el tamaño de la pantalla
          final bool isCompact = w < 400;

          return SizedBox(
            child: Stack(
              children: [
                SizedBox(
                  width: w, //Toma todo el ancho de la pantalla
                  height: h / 4, //Toma el 25% del alto de la pantalla
                  child: CustomPaint(painter: CuadroUno()),
                ),
                SizedBox(
                  width: w, //Toma todo el ancho de la pantalla
                  height: h, //Toma todo el alto de la pantalla
                  child: CustomPaint(painter: CuadroDos()),
                ),
                SizedBox(
                  width: w, //Toma todo el ancho de la pantalla
                  height: h / 4, //Toma todo el alto de la pantalla
                  child: CustomPaint(painter: Accion(_controller.value)),
                ),

                SizedBox(
                  width: w, //Toma todo el ancho de la pantalla
                  height: h, //Toma todo el alto de la pantalla
                  child: CustomPaint(painter: Accion2(_controller.value)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
