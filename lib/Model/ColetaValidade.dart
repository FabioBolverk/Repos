
import 'CapDate.dart';
class ColetaValidade {

  int id;
  int repositor;
  int produto;
  int qtdVencida = 0;
  DateTime data;
  int status;


 int get getId => id;

 set setId(int id) => this.id = id;

 int get getRepositor => repositor;

 set setRepositor(int repositor) => this.repositor = repositor;

 int get getProduto => produto;

 set setProduto(int produto) => this.produto = produto;

 int get getQtdVencida => qtdVencida;

 set setQtdVencida(int qtdVencida) => this.qtdVencida = qtdVencida;

 DateTime get getData => data;

 set setData(DateTime date) => this.data = data;

 int get getStatus => status;

 set setStatus(int status) => this.status = status;

ColetaValidade(this.id,this.repositor,this.produto,this.qtdVencida,this.data,this.status);


void capData(){
  CapDate datav = new CapDate();
  this.data = datav.getTempoCapturado;
}

int qdtVencido(bool qtd){
  if(qtd == true){
    this.qtdVencida++;
  }


}

void setUserId(int id) {
    this.id = id;
  }


 Map<String, dynamic> toMap(){
   var map = <String, dynamic>{
     'id': id,  
     'repositor': repositor,
     'produto': produto,
     'qtdVencida':qtdVencida,
     'data':data,
     'status':status,
   };
   return map;
 }

 ColetaValidade.fromMap(Map<String, dynamic> map){
    id = map['id'];
    repositor = map['repositor'];
    produto = map['produto'];
    qtdVencida = map['qtdVencida'];
    data = map['data'];
    status = map['status'];
    
   
 }
  
}