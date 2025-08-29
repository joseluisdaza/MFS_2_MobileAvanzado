import 'package:demo/tareaClase2/mixin/movimientos.dart';
import 'package:flutter/material.dart';

class Objetomovil extends StatefulWidget {
  final bool esVertical;
  final VoidCallback onRemove;

  const Objetomovil({
    super.key,
    required this.esVertical,
    required this.onRemove,
  });

  @override
  State<Objetomovil> createState() => _ObjetomovilState();
}

class _ObjetomovilState extends State<Objetomovil>
    with movimientoVertical, movimientoHorizontal {
  double x = 50;
  double y = 50;

  @override
  void initState() {
    super.initState();
    if (widget.esVertical) {
      moverVertical(setState, () => y, (value) => y = value);
    } else {
      moverHorizontal(setState, () => x, (value) => x = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: GestureDetector(
        onDoubleTap: widget.onRemove,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: widget.esVertical ? Colors.blue : Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
