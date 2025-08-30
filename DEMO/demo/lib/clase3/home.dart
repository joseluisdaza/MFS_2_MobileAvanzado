import 'package:demo/clase3/clase_sellada_mae.dart';
import 'package:demo/clase3/codigo_exahaustivo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Luz luz = Roja();
  //MaterialColor permite cambiar los colores ya definidos.
  MaterialColor? colorFoco;
  String? nombreColor;
  String? accion;

  @override
  void initState() {
    super.initState();
    colorFoco = colorSegun(luz);
    nombreColor = nombreSegun(luz);
    accion = accionSegun(luz);
  }

  void cambio() {
    setState(() {
      luz = siguiente(luz);
      colorFoco = colorSegun(luz);
      nombreColor = nombreSegun(luz);
      accion = accionSegun(luz);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFoco!.shade100,
      appBar: AppBar(
        backgroundColor: colorFoco!.shade800,
        title: Text("Semaforo sealed"),
      ),
      body: Center(
        child: Column(
          children: [foco(), mensajeColor(), mensajeAccion(), boton()],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }

  Widget foco() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [colorFoco!.shade50, colorFoco!.shade900],
        ),
        borderRadius: BorderRadius.all(Radius.circular(200)),
      ),
    );
  }

  Widget mensajeColor() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Text(nombreColor!, style: TextStyle(fontSize: 25)),
    );
  }

  Widget mensajeAccion() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Text(accion!, style: TextStyle(fontSize: 20)),
    );
  }

  Widget boton() {
    return FilledButton.icon(
      onPressed: () {
        cambio();
      },
      label: Text('Cambio'),
    );
  }
}
