import 'package:flutter/cupertino.dart';

abstract class UsuarioAbstract{

String nome;
int id;
String numCel;


 String get getNome => nome;

 set setNome(String nome) => this.nome = nome;

 int get getId => id;

 set setId(int id) => this.id = id;

 String get getNumCel => numCel;

 set setNumCel(String numCel) => this.numCel = numCel;

 


UsuarioAbstract(this.nome,this.id,this.numCel);

}






 

