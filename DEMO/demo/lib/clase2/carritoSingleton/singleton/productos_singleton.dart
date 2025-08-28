class ProductListSingleton {
  ProductListSingleton._internal();

  static final ProductListSingleton _instance =
      ProductListSingleton._internal();

  factory ProductListSingleton() => _instance;

  List<String> get carrosElegidos => _carrosElegidos;
  final List<String> _carrosElegidos = [];
}
