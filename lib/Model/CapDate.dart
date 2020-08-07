import 'package:date_format/date_format.dart';

class CapDate {
  DateTime tempoCapturado;
  DateTime horaCapturado;
  

  DateTime tempo(){
      DateTime tempoAgora = new DateTime.now();
      formatDate(tempoAgora,[dd,'-',mm,'-',yy,'/',hh, '-',nn]);
      setTempoCapturado = tempoAgora;

      
      return tempoAgora;
    }


    DateTime hora(){
      DateTime tempoAgora = new DateTime.now();
      formatDate(tempoAgora,[hh,':',nn]);
      setTempoCapturado = tempoAgora;

      
      return tempoAgora;
    }

    DateTime get getTempoCapturado => tempoCapturado;

    set setTempoCapturado(DateTime tempoCapturado) => this.tempoCapturado = tempoCapturado;

    DateTime get getHoraCapturado => horaCapturado;

    set setHoraCapturado(DateTime horaCapturado) => this.horaCapturado = horaCapturado;




    
}