class Configuracion {
  static final Configuracion _instance = Configuracion._internal();

  String usuario = '';
  int nivel = 0;

  //Definir el constructor
  Configuracion._internal();

  //Factory para acceder a la instancia
  factory Configuracion() {
    return _instance;
  }
}
