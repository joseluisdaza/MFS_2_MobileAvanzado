import 'package:demo/clase3/clase_sellada_mae.dart';
import 'package:flutter/material.dart';

String accionSegun(Luz luz) => switch (luz) {
  Roja() => 'Detente',
  Amarilla() => 'Precaución',
  Verde() => 'Avanzar',
};

String nombreSegun(Luz luz) => switch (luz) {
  Roja() => 'Roja',
  Amarilla() => 'Amarilla',
  Verde() => 'Verde',
};

// MaterialColor colorSegun(Luz luz) => switch (luz) {
//   Roja() => Colors.red,
//   Amarilla() => Colors.yellow,
//   Verde() => Colors.green,
// };

MaterialColor colorSegun(Luz luz) {
  switch (luz) {
    case Roja():
      return Colors.red;
    case Amarilla():
      return Colors.yellow;
    case Verde():
      return Colors.green;
  }
}

Luz siguiente(Luz luz) => switch (luz) {
  Roja() => Verde(),
  Verde() => Amarilla(),
  Amarilla() => Roja(),
};
