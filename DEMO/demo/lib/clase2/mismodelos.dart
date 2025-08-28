//Ejemplos de Mixin
//Que son clases que se pueden reusar.
class Ave {
  void volar() {
    print('Volando.');
  }

  void picotear() {
    print('Picoteando.');
  }

  void construyeNidoEnElArbol() {
    print('Construyendo un nido en el árbol.');
  }
}

class Pez {
  void nadar() {
    print('Nadando.');
  }

  void respirarPorLasBranquias() {
    print('Respirando por las branquias.');
  }

  void duermeConLosOjosAbiertos() {
    print('Durmiendo con los ojos abiertos.');
  }
}

class Pato extends Ave {
  void caminaOscilante() {
    print('Caminando de forma oscilante.');
  }

  void quack() {
    print('Cuac cuac.');
  }
}

class Pato1 extends Pez {
  void caminaOscilante() {
    print('Caminando de forma oscilante.');
  }
}
