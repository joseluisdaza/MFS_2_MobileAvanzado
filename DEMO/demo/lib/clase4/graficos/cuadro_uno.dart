import 'package:flutter/material.dart';

class CuadroUno extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.red;

    //Dibujamos un rectangulo.
    // final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRRect(
      RRect.fromLTRBXY(0, 0, size.width, size.height, 0, 0),
      paint,
    );

    //Definimos los puntos para que jalen a la curva
    final p0 = Offset(0, 0);
    final p1 = Offset(size.width / 4, size.height * 2);
    final p2 = Offset(size.width * 3 / 4, -size.height);
    final p3 = Offset(size.width, size.height);

    //Definimos un color de linea
    Paint pincel =
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.teal
          ..strokeWidth = 3;

    // Definimos la ruta
    Path m = Path();
    m.moveTo(p0.dx, p0.dy);
    m.cubicTo(p1.dx, p1.dy, p2.dx, p2.dy, p3.dx, p3.dy);

    m.lineTo(0, size.height);
    canvas.drawPath(m, pincel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
