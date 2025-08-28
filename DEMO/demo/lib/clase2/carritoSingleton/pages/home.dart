import 'package:demo/clase2/carritoSingleton/pages/carrito.dart';
import 'package:demo/clase2/carritoSingleton/singleton/productos_singleton.dart';
import 'package:flutter/material.dart';
import '../repository/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductListSingleton productList = ProductListSingleton();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: const Text('Auto tienda'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Carrito()),
              );
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
          SizedBox(width: 5),
          CircleAvatar(
            backgroundColor: Colors.green.shade900,
            child: Text(
              '${ProductListSingleton().carrosElegidos.length}',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: marcasDisponibles.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(marcasDisponibles[index]),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      //Agregar elementos del singleton
                      productList.carrosElegidos.add(marcasDisponibles[index]);
                    });
                  },
                  icon: Icon(Icons.favorite_border),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
