import 'package:demo/clase2/carritoSingleton/singleton/productos_singleton.dart';
import 'package:flutter/material.dart';

class Carrito extends StatefulWidget {
  const Carrito({super.key});

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: const Text('Carros elegidos'),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Acción para el botón
            },
            child: const Text('Pagar'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: ProductListSingleton().carrosElegidos.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Text('${index + 1}'),
                title: Text(ProductListSingleton().carrosElegidos[index]),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      ProductListSingleton().carrosElegidos.removeAt(index);
                    });
                  },
                  icon: Icon(Icons.delete, color: Colors.red.shade900),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
