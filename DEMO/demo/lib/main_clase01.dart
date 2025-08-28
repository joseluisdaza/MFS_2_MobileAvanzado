//clase01 - Isolates
// import 'package:demo/plantilla.dart';
//import 'package:demo/fibo_recursivo.dart';
// import 'package:demo/fibo_isolate.dart';

// import 'package:demo/llamadas_isolates/perfecto_isolate_spawn.dart';
import 'package:demo/llamadas_isolates/perfecto_isolate_spawn_docente.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    );
  }
}
