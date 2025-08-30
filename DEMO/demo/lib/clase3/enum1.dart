enum EstadoPedido { pendiente, procesando, enviado, entregado, cancelado }

void main() {
  EstadoPedido estado = EstadoPedido.entregado;

  int index = EstadoPedido.enviado.index;
  String nombreEstado = estado.name;

  print("estado: $estado");
  print("index: $index");
  print("nombreEstado: $nombreEstado");
  //Recuperar todos los valores
  print(EstadoPedido.values);

  EstadoPedido estadoRecuperado = EstadoPedido.values[index];
  print('recuperado: $estadoRecuperado');
}
