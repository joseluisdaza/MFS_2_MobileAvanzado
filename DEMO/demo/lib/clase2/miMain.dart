import 'mismodelos.dart';

void main() {
  Pato pato = Pato();
  print('soy Pato y:');
  print('----------------');
  pato.volar();
  pato.picotear();
  pato.construyeNidoEnElArbol();
  pato.caminaOscilante();
  pato.quack();
  print('\n');

  Pato1 pato1 = Pato1();
  print('soy Pato1 y:');
  print('----------------');
  pato1.caminaOscilante();
  pato1.nadar();
  pato1.respirarPorLasBranquias();

  //Ejemplo con mixins
}
