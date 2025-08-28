import 'lazy_singleton.dart';

void main() {
  final config1 = Configuracion_Lazy();
  config1.usuario = 'Juan';
  config1.nivel = 1;

  final config2 = Configuracion_Lazy();
  config2.usuario = 'Pedro';
  config2.nivel = 2;

  print('Usuario: ${config2.usuario}, Nivel: ${config2.nivel}');
}
