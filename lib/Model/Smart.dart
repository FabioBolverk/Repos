import 'Empresa.dart';
class Smart {

  int id;
  Empresa empresa;
  String codRegistro;
  String descricao;
  int repositor;
  int estoquista;


 int get getId => id;

 set setId(int id) => this.id = id;

 Empresa get getEmpresa => empresa;

 set setEmpresa(Empresa id) => this.empresa = empresa;

 String get getCodRegistro => codRegistro;

 set setCodRegistro(String codRegistro) => this.codRegistro = codRegistro;

 String get getDescricao => descricao;

 set setDescricao(String descricao) => this.descricao = descricao;

 int get getRepositor => repositor;

 set setRepositor(int repositor) => this.repositor = repositor;

 int get getEstoquista => estoquista;

 set setEstoquista(int estoquista) => this.estoquista = estoquista;



Smart(this.id,this.empresa,this.codRegistro,this.descricao,this.repositor,this.estoquista);

 void setUserId(int id) {
    this.id = id;
  }


Map<String, dynamic> toMap(){
   var map = <String, dynamic>{
     'id': id,  
     'empresa': empresa,
     'codRegistro': codRegistro,
     'descricao':descricao,
     'repositor':repositor,
     'estoquista':estoquista,
  
   };
   return map;
 }

  Smart.fromMap(Map<String, dynamic> map){
    id = map['id'];
    empresa = map['empresa'];
    codRegistro = map['codRegistro'];
    descricao = map['descricao'];
    repositor = map['repositor'];
    estoquista = map['estoquista'];
    
   
 }

  
}