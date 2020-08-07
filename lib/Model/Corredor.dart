import 'Empresa.dart';

class Corredor {
  Empresa empresa;
  String identificador;
  String descricao;
  int id;




Empresa get getEmpresa => empresa;
set setEmpresa(Empresa identificador) => this.empresa = empresa;

 String get getIdentificador => identificador;

 set setIdentificador(String identificador) => this.identificador = identificador;

 String get getDescricao => descricao;

 set setDescricao(String descricao) => this.descricao = descricao;

 int get getId => id;



 set setId(int id) => this.id = id;
 

Corredor(this.id,this.empresa,this.identificador,this.descricao);

 void setUserId(int id) {
    this.id = id;
  }

 Map<String, dynamic> toMap(){
   var map = <String, dynamic>{
     'Empresa':empresa,
     'identificador':identificador,
     'descricao':descricao,
     'id':id,

   };
   return map;
 }

 Corredor.fromMap(Map<String, dynamic> map){
   empresa = map['Empresa'];
   identificador = map['identificador'];
   descricao = map['descricao'];
   id = map['id'];
 }


  
}