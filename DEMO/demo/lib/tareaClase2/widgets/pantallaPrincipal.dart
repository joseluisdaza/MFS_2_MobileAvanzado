import 'package:demo/tareaClase2/singleton/configuration.dart';
import 'package:demo/tareaClase2/widgets/objetoMovil.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final configuracion = Configuration();
  final List<Widget> objetos = [];

  void agregarObjeto(bool esVertical) {
    setState(() {
      configuracion.contadorDeElementos++;
      objetos.add(
        Objetomovil(
          esVertical: esVertical,
          onRemove: () {
            setState(() {
              objetos.removeWhere((element) => element.key == objetos.last.key);
              configuracion.contadorDeElementos--;
            });
          },
          key: UniqueKey(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Juego con Mixins y Singleton')),
      body: Stack(
        children: [
          ...objetos,
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              color: Colors.blueGrey.shade200,
              padding: const EdgeInsets.all(8),
              child: Text(
                'Elementos: ${configuracion.contadorDeElementos}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'vertical',
            onPressed: () => agregarObjeto(true),
            child: const Icon(Icons.arrow_downward),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'horizontal',
            onPressed: () => agregarObjeto(false),
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
