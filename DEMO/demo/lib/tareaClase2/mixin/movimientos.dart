mixin movimientoVertical {
  void moverVertical(
    Function setState,
    double Function() getY,
    void Function(double) setY,
  ) async {
    while (true) {
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        setY(getY() + 10);
      });
    }
  }
}

mixin movimientoHorizontal {
  void moverHorizontal(
    Function setState,
    double Function() getX,
    void Function(double) setX,
  ) async {
    while (true) {
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        setX(getX() + 10);
      });
    }
  }
}
