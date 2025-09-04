import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Home extends HookWidget {
  Home({super.key});
  TextEditingController tedNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vector = useState<List<int>>([]);
    final natural = useState<int>(1);

    useEffect(() {
      //Timer automatico que se ejecuta cada 500 milisegundos
      final timer = Timer.periodic(Duration(milliseconds: 500), (t) {
        if (tedNum.text.isNotEmpty) {
          //Agrega los numeros mientras no sea maayor o igual que el text edit controller
          if (natural.value <= int.parse(tedNum.text)) {
            vector.value = [...vector.value, natural.value];
            natural.value++;
          } else {
            t.cancel();
          }
        }
      });

      return () {
        timer.cancel();
      };
    }, [natural.value]);

    return Scaffold(
      appBar: AppBar(title: const Text('Clase 5 - Hooks animado y Timer')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: tedNum,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese n:',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            Text('Vector: ${vector.value}', style: TextStyle(fontSize: 25)),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                tedNum.clear();
                //Reinicia el conteo
                natural.value = 1;
                vector.value = [];
              },
              child: Text('Limpiar'),
            ),
          ],
        ),
      ),
    );
  }
}
