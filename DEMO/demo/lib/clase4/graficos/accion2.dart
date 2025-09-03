import 'package:flutter/material.dart';

class Accion2 extends CustomPainter {
  double progress = 0.0;

  Accion2(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    final p0 = Offset(size.width, size.height / 4);
    final p1 = Offset(-size.width / 2, size.height / 2);
    final p2 = Offset(size.width * 1.5, size.height * 3 / 4);
    final p3 = Offset(0, size.height);

    // La fórmula es: B(t) = (1-t)^3P0 + 3(1-t)^2tP1 + 3(1-t)t^2P2 + t^3P3
    //de izquierda a derecha
    double t = progress;
    dynamic w = 1 - t;

    //de Derecha a izquierda
    // double t = 1 - progress;
    // dynamic w = 1 - t;

    final punto =
        p0 * w * w * w +
        p1 * 3 * w * w * t +
        p2 * 3 * w * t * t +
        p3 * t * t * t;

    canvas.drawCircle(punto, 25, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
