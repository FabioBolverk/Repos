import 'Produto.dart';

class Etiqueta {

int _idEtiqueta;
Produto _produto;
double _preco;
int _qtd;

 int get idEtiqueta => _idEtiqueta;

 set idEtiqueta(int value) => _idEtiqueta = value;

 double get preco => _preco;

 set preco(double value) => _preco = value;

 int get qtd => _qtd;

 set qtd(int value) => _qtd = value;
 



void PedirEtiqueta(Produto produto, double preco, int qtd){
  this._produto = produto;
  this._preco = preco;
  this._qtd = qtd;

}


Map<String, dynamic> toMapEtiqueta(){
   var map = <String, dynamic>{
     'idEtiqueta':_idEtiqueta,
     'Produto':_produto,
     'preco':_preco,
     'qtd':_qtd,

   };
   return map;
 }

 Etiqueta.fromMap(Map<String, dynamic> map){
   _idEtiqueta = map['idEtiqueta'];
   _produto = map['produto'];
   _preco = map['preco'];
   _qtd = map['qtd'];
 }



  
}



