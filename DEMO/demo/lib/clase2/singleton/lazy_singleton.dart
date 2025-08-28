import 'package:flutter/foundation.dart';

class Configuracion_Lazy {
  static Configuracion_Lazy? _instancia;

  String usuario = '';
  int nivel = 0;

  Configuracion_Lazy._privado();

  factory Configuracion_Lazy() {
    //Si es nulo asigna la instancia privada, caso contrario lo deja como esta
    _instancia ??= Configuracion_Lazy._privado();
    return _instancia!;
  }
}
