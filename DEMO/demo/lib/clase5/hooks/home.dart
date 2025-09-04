import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //Se inicializan una sola vez.
    //hook que usaremos como contador.
    final n = useState<int>(-1);
    final vector = useState<List<int>>([]);

    //Funcion para agregar el nuevo numero a la lista, cada vez que modifique el valor de n
    useEffect(
      () {
        //PPara que no muestre por defecto el 0 sin hacer click.
        if (n.value > 0) {
          vector.value = [...vector.value, n.value];
        }

        //No hay nada que limpiar de momento, por tanto retorna null
        //en otro caso se retornaria una funcion que se ejecutaria al desmontar el widget
        return null;
      },
      //lista de dependencias.
      [n.value],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Clase 5 - Hooks')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                //Usamos el hook para actualizar el valor de n
                n.value++;
              },
              child: Text('Siguiente nro Natural'),
            ),

            SizedBox(height: 50),

            Text('Vector: ${vector.value}', style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
