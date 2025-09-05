// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: CounterHost(), // El “host” que maneja el estado
//     );
//   }
// }

// /// 1) Un StatefulWidget que posee el estado y envuelve a sus hijos con el InheritedWidget
// class CounterHost extends StatefulWidget {
//   const CounterHost({super.key});

//   @override
//   State<CounterHost> createState() => _CounterHostState();
// }

// class _CounterHostState extends State<CounterHost> {
//   int _count = 0;

//   void _inc() => setState(() => _count++);

//   @override
//   Widget build(BuildContext context) {
//     return CounterScope(
//       // ← Inyecta el valor a todo el subárbol
//       count: _count,
//       child: Scaffold(
//         appBar: AppBar(title: const Text('InheritedWidget contador')),
//         body: const Center(child: CounterText()), // lee el valor sin props
//         floatingActionButton: FloatingActionButton(
//           onPressed: _inc,
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

// /// 2) El InheritedWidget que expone el valor del contador a todo lo que esta debajo del arbol sin pasar por props
// /// ademas decide a quien notificar cuando cambia (UpdateShouldNotify)
// class CounterScope extends InheritedWidget {
//   final int count;

//   const CounterScope({super.key, required this.count, required Widget child})
//     : super(child: child);

//   // Acceso cómodo
//   static CounterScope of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<CounterScope>()!;
//   }

//   // Notifica a los dependientes SOLO si cambia el valor
//   @override
//   bool updateShouldNotify(CounterScope oldWidget) => count != oldWidget.count;
// }

// /// 3) Un consumidor que se “suscribe” al valor heredado y se recostruye cuando cambia
// class CounterText extends StatelessWidget {
//   const CounterText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final count = CounterScope.of(context).count; // crea dependencia
//     return Text('Contador: $count', style: const TextStyle(fontSize: 28));
//   }
// }
