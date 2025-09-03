import 'package:demo/clase3/codigo_exahaustivo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Apuntamos por defecto al primer paso
  int _currentStep = 0;

  //Actualizar cual es el paso activo
  _tapped(int step) {
    setState(() {
      //Se puede agregar validaciones para que no se pueda ir a cualquier paso
      //o a pasos que no existan.
      _currentStep = step;
    });
  }

  _siguiente() {
    setState(() {
      //Evitamos ir al paso 3 o mas, porque solo estamos disendo 3 pasos, (0,1,2  )
      if (_currentStep < 2) {
        _currentStep++;
      }
    });
  }

  _anterior() {
    setState(() {
      //Evitamos ir al paso -1 o menos, porque solo estamos disendo 3 pasos, (0,1,2  )
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clase 5 - Stepper')),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              //Indicamos que va a ser de estilo vertical
              type: StepperType.vertical,
              //Efecto de cambio de pasos
              physics: ClampingScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (s) => _tapped(s),
              onStepContinue: _siguiente,
              onStepCancel: _anterior,
              controlsBuilder: (context, details) {
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: _siguiente,
                      child: Text('Siguiente'),
                    ),
                    ElevatedButton(onPressed: _anterior, child: Text('Atras')),
                  ],
                );
              },
              steps: <Step>[
                //Step 1
                Step(
                  title: Text('Email y Password'),
                  content: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Ingresa el email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Ingresa el password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Step 2
                Step(
                  title: Text('Nombre, Celular, Fijo'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Ingresa el nombre completo',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Ingresa el celular',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Ingresa el fijo',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Step 3
                Step(
                  title: Text('Cajon postal, calle, Número, ciudad'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Ingresa el cajon postal',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Ingresa la calle',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Ingresa el número',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Ingresa la ciudad',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
