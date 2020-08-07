import 'Corredor.dart';
class Quadra {
  int id;
  Corredor idCorredor;
  String identificador;
  String descricao;


  
 int get getId => id;

 set setId(int id) => this.id = id;

 String get getIdentificador => identificador;

 set setIdentificador(String identificador) => this.identificador = identificador;

 String get getDescricao => descricao;

 set setDescricao(String descricao) => this.descricao = descricao;
 
 
Quadra(this.id,this.idCorredor,this.identificador,this.descricao);

 void setUserId(int id) {
    this.id = id;
  }



 Map<String, dynamic> toMap(){
   var map = <String, dynamic>{
     'idQuadra':id,
     'Corredor':idCorredor,
     'identificador':identificador,
     'descricao':descricao,

   };
   return map;
 }

 Quadra.fromMap(Map<String, dynamic> map){
   id = map['id'];
   idCorredor = map['idCorredor'];
   identificador = map['identificador'];
   descricao = map['descricao'];
 }


  
}