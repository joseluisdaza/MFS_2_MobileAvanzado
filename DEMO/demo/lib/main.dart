//clase01 - Isolates
// import 'package:demo/plantilla.dart';
//import 'package:demo/fibo_recursivo.dart';
// import 'package:demo/fibo_isolate.dart';

// import 'package:demo/llamadas_isolates/perfecto_isolate_spawn.dart';
// import 'package:demo/llamadas_isolates/perfecto_isolate_spawn_docente.dart';

//clase 02
// import 'package:demo/clase2/carritoSingleton/pages/home.dart';

//Tarea Clase 2 Singleton y Mixins
// import 'package:demo/tareaClase2/widgets/pantallaPrincipal.dart';

//Clase3
//import 'package:demo/clase3/home.dart';

//Clase4
//import 'package:demo/clase4/home.dart';

//Clase5
import 'package:demo/clase5/home.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Advanzado - Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    );
  }
}
