import 'package:flutter/material.dart';

class PaginaDos extends StatefulWidget {
  const PaginaDos({super.key});

  @override
  State<PaginaDos> createState() => _PaginaDosState();
}

class _PaginaDosState extends State<PaginaDos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina dos')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Volver'),
        ),
      ),
    );
  }
}
