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
//import 'package:demo/clase5/home.dart';
//import 'package:demo/clase5/homeHorizontal.dart';
// import 'package:demo/clase5/hooks/home.dart';
//import 'package:demo/clase5/hooks/home2.dart';

//Clase6
//import 'package:demo/clase6/themes/home.dart';
// import 'package:demo/clase6/themes/home2.dart';
import 'package:demo/clase6/themes/home3.dart';
import 'package:demo/clase6/themes/theme.dart';

import 'package:flutter/material.dart';

//Normal
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Mobile Advanzado - Flutter',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       // home: const Home(),
//       home: Home(),
//     );
//   }
// }

//Clase6 Theme 2
// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatefulWidget {
//   const MainApp({super.key});

//   @override
//   State<MainApp> createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> {
//   ThemeMode _mode = ThemeMode.light;

//   void _toggleLightDark() {
//     setState(() {
//       // alterna solo entre Light y Dark (ignora System)
//       _mode = (_mode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       themeMode: _mode,
//       home: Home(mode: _mode, onToggleLightDark: _toggleLightDark),
//     );
//   }
// }

//clase6 theme 3
void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _mode = ThemeMode.light;

  void _toggleLightDark() {
    setState(() {
      // alterna solo entre Light y Dark (ignora System)
      _mode = (_mode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: _mode,
      home: Home(mode: _mode, onToggleLightDark: _toggleLightDark),
    );
  }
}
