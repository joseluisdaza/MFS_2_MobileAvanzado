import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: _lightScheme,
  scaffoldBackgroundColor: _lightScheme.background,
);

final ThemeData darkMode =
    ThemeData(
      useMaterial3: true,
      colorScheme: _darkScheme,
      scaffoldBackgroundColor: _darkScheme.background,
    ).copyWith();

// alternativa unoooooooooooo
final ColorScheme _lightScheme = ColorScheme.light(
  //background: Colors.amber.shade400,
  surface: Colors.amber.shade300,
  primary: Colors.amber.shade50,
  onPrimary: Colors.amber, // contraste sobre primary claro
  secondary: Colors.amber.shade200,
);

final ColorScheme _darkScheme = ColorScheme.dark(
  //background: Colors.blueGrey.shade900,
  surface: Colors.blueGrey.shade700,
  primary: Colors.blueGrey.shade50,
  onPrimary: Colors.blueGrey, // contraste sobre primary oscuro
  secondary: Colors.blueGrey,
);
