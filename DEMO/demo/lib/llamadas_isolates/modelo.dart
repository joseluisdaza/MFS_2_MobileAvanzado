class Perfecto {
  int n;
  Perfecto(this.n);

  bool esPerfecto() {
    int suma = 0;
    //~/ sirve para la division entera
    for (int i = 1; i <= n ~/ 2; i++) {
      if (n % i == 0) {
        suma += i;
      }
    }
    return suma == n;
  }
}
