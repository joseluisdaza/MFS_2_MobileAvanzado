//Ejemplos de Mixin
//Que son clases que se pueden reusar.

import 'misMixins.dart';

class Ave with Volar {
  void picotear() {
    print('Picoteando.');
  }

  void construyeNidoEnElArbol() {
    print('Construyendo un nido en el árbol.');
  }
}

class Pez with Nadar {
  void respirarPorLasBranquias() {
    print('Respirando por las branquias.');
  }

  void duermeConLosOjosAbiertos() {
    print('Durmiendo con los ojos abiertos.');
  }
}

class Pato with Volar, Nadar {
  void caminaOscilante() {
    print('Caminando de forma oscilante.');
  }

  void quack() {
    print('Cuac cuac.');
  }
}
