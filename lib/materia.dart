class Materia{
  String name;
  int _calificacion;

  Materia(this.name,this._calificacion);

  set calificacion(int value){
    _calificacion = value;
  }

  get calificacion => calificacion;

  String finSemestre(){
    if(_calificacion>=60){
      return "¡Felicidades! Materia aprobada :) ";
    }
    else{
      return "Lástima... nos vemos el proximo semestre :( ";
    }
  }

  String toString(){
    return "Materia: ${name}\nCalificacion: ${_calificacion}\n${finSemestre()}";
  }


}