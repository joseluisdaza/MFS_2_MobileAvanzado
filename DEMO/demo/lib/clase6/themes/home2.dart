import 'package:flutter/material.dart';
//import 'package:themes_3/pagina.dart';
import 'pagina.dart';

class Home extends StatefulWidget {
  final ThemeMode mode;
  final VoidCallback onToggleLightDark;
  //final VoidCallback onUseSystem;

  const Home({
    super.key,
    required this.mode,
    required this.onToggleLightDark,
    // required this.onUseSystem,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes'),
        actions: [
          IconButton(
            onPressed: widget.onToggleLightDark,
            icon: Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text('Comportamiento de los colores'),
              SizedBox(height: 20),
              Icon(Icons.favorite, size: 50),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: Text('ElevatedButton')),
              SizedBox(height: 20),
              OutlinedButton(onPressed: () {}, child: Text('OutlinButton')),
              SizedBox(height: 20),
              FilledButton(onPressed: () {}, child: Text('fiulledButton')),
              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Soy un Card'),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => PaginaDos()),
          );
        },
      ),
    );
  }
}
