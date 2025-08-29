class Configuration {
  static final Configuration _instance = Configuration._internal();

  factory Configuration() {
    return _instance;
  }

  Configuration._internal();

  int contadorDeElementos = 0;
}
