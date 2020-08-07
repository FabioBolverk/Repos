import 'Empresa.dart';
import 'Gondola.dart';
class Produto {
  int id;
  String nome;
  Empresa empresa;
  Gondola gondola;
  int codInterno;
  int codBarra;
  String descricao;
  String undMedida;
  double precoVenda;
  String foto;
  DateTime dataAtualizacao;

 int get getId => id;

 set setId(int id) => this.id = id;

 String get getNome => nome;

 set setNome(String nome) => this.nome = nome;

 int get getEmpresa => id;

 set setEmpresa(Empresa empresa) => this.empresa = empresa;

 int get getCodInterno => codInterno;

 set setCodInterno(int codInterno) => this.codInterno = codInterno;

 int get getCodBarra => codBarra;

 set setCodBarra(int codBarra) => this.codBarra = codBarra;

 String get getDescricao => descricao;

 set setDescricao(String descricao) => this.descricao = descricao;

 String get getUndMedida => undMedida;

 set setUndMedida(String undMedida) => this.undMedida = undMedida;

 double get getPrecoVenda => precoVenda;

 set setPrecoVenda(double precoVenda) => this.precoVenda = precoVenda;

 String get getFoto => foto;

 set setFoto(String foto) => this.foto = foto;
  
  
 
Produto(this.id,this.nome,this.empresa,this.gondola,this.codInterno,this.codBarra,this.descricao,
this.undMedida,this.precoVenda,this.foto,this.dataAtualizacao);

void setUserId(int id) {
    this.id = id;
  }

Map<String, dynamic> toMap(){
   var map = <String, dynamic>{
     'id': id,
     'nome': nome,
     'empresa': empresa,
     'gondola': gondola,
     'condInterno': codInterno,
     'codBarra': codBarra,
     'descricao': descricao,
     'undMedida': undMedida,
     'precoVenda': precoVenda,
     'foto': foto,
     'dataAtualizacao': dataAtualizacao,

   };
   return map;
 }

 Produto.fromMap(Map<String, dynamic> map){
    id = map['id'];
    nome = map['nome'];
    empresa = map['empresa'];
    gondola = map['gondola'];
    codInterno = map['codInterno'];
    codBarra = map['codBarra'];
    descricao = map['descricao'];
    undMedida = map['undMedida'];
    precoVenda = map['precoVenda'];
    foto = map['foto'];
    dataAtualizacao= map['dataAtualizacao'];
 }





}