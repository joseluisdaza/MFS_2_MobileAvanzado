import 'eager_singleton.dart';

void main() {
  //Primera forma de acceder a la configuración
  var config1 = Configuracion();
  config1.usuario = 'Juan';
  config1.nivel = 3;

  //Segunda instancia del singleton
  var config2 = Configuracion();
  config2.usuario = 'Pedro';
  config2.nivel = 2;

  print(' config1 usuario: ${config1.usuario}, nivel: ${config1.nivel}');
  print(' config2 usuario: ${config2.usuario}, nivel: ${config2.nivel}');
}
