import 'Quadra.dart';
class Gondola {
  int id;
  Quadra idQuadra;
  String identificador;
  String descricao;

  Gondola(this.id,this.idQuadra,this.identificador,this.descricao);

 int get getId => id;

 set setId(int id) => this.id = id;

 String get getIdentificador => identificador;

 set setIdentificador(String identificador) => this.identificador = identificador;

 String get getDescricao => descricao;

 set setDescricao(String descricao) => this.descricao = descricao;

 


 Map<String, dynamic>
 toMap(){
   var map = <String, dynamic>{
     'id':id,
     'Quadra':idQuadra,
     'identificador':identificador,
     'descricao':descricao

   };
   return map;
 }

 void setUserId(int id) {
    this.id = id;
  }

 Gondola.fromMap(Map<String, dynamic> map){
   id = map['id'];
   idQuadra = map['Quadra'];
   identificador = map['identificador'];
   descricao = map['descricao'];
 }

  
 

}