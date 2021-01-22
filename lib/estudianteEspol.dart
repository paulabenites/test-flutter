
import 'package:practica_dart/materia.dart';

abstract class EstudianteEspol{
  String _matricula;
  var _materia;

  EstudianteEspol(){
    _matricula = "9999";
  }

  set matricula(String value){
    _matricula = value;
  }

  set materia(Materia materia){
    _materia = materia;
  }

  get matricula => _matricula;

}