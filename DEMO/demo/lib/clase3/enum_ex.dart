//Ejemplo de un enum exhaustivo
enum Semaforo { rojo, amarillo, verde }

void main() {
  //Esto se hace en las versiones anteriores a Dart 3
  String describir(Semaforo color) => switch (color) {
    Semaforo.rojo => "Foco rojo",
    Semaforo.amarillo => "Foco amarillo",
    Semaforo.verde => "Foco verde",
  };
  print(describir(Semaforo.rojo));

  Semaforo color = Semaforo.verde;
  switch (color) {
    case Semaforo.rojo:
      print("El semáforo está en rojo.");
      break;
    case Semaforo.amarillo:
      print("El semáforo está en amarillo.");
      break;
    case Semaforo.verde:
      print("El semáforo está en verde.");
      break;
  }
}
