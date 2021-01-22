// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica_dart/estudianteFIEC.dart';
import 'package:practica_dart/materia.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FIEC',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simulador de aprobacion FIEC'),
          backgroundColor: Colors.pink,
        ),
        body: new Container(
          child: new Center(
            child: new ListView(
              padding: const EdgeInsets.all(20),
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                FlutterLogo(
                  size: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20, bottom: 40),
                  child: Text(
                    '¡Bienvenido!',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                ),

                InputForm(),

              ],
            ),
          ),
        )
      ),
    );
  }

}

class InputForm extends StatefulWidget {
  InputForm({Key key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();

}

/// This is the private State class that goes with MyStatefulWidget.
class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final calificacionController = TextEditingController();
  final matriculaController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    calificacionController.dispose();
    matriculaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Ingrese su nombre',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Porfavor ingrese su nombre';
              }
              return null;
            },
          ),
          TextFormField(
            controller: matriculaController,
            decoration: const InputDecoration(
              hintText: 'Ingrese su matricula',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Porfavor ingrese su matricula';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top:40,bottom: 20),
            child: Text(
              "Materia: Lenguajes de Programación",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20),
            ),
          ),

          TextFormField(
            controller: calificacionController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                hintText: 'Ingrese su promedio',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Porfavor ingrese su promedio de calificaciones';
              }
              return null;
            },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    var estudiante = new EstudianteFIEC(nameController.text);
                    int calificacion = int.parse(calificacionController.text);
                    estudiante.matricula = matriculaController.text;
                    var lp = new Materia("Lenguajes de programacion", calificacion);
                    String datos = estudiante.toString();
                    String resultados = lp.toString();

                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Datos del estudiante: \n$datos\nResultados:\n$resultados"),
                        );
                      },
                    );
                  }
                },
                child: Text('Calcular'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
