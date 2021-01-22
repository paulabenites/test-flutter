import 'package:practica_dart/estudianteEspol.dart';

class EstudianteFIEC extends EstudianteEspol{
  String _name;

  set name(String name){
    _name = name;
  }

  String get name => _name;

  String toString(){
    return "Nombre: $_name, matricula ${matricula}";
  }



  EstudianteFIEC(this._name);


}