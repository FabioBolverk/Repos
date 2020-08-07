import 'package:app_repo/Model/Estoquista.dart';
import 'package:app_repo/Model/Produto.dart';
import 'package:app_repo/Model/Repositor.dart';
import 'package:app_repo/Model/CapDate.dart';

class ColetaReposicao {
  int id;
  int repositor;
  String produto;
  int qtdSolicitado;
  DateTime dataSolicitacao;
  int estoquista;
  int qtdAtendida;
  bool statusRepositor;
  bool statusEstoquista;
  DateTime dataAtendida;

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getProduto => produto;

  set setProduto(String produto) => this.produto = produto;

  int get getRepositor => repositor;

  set setRepositor(int repositor) => this.repositor = repositor;

  int get getEstoquista => estoquista;

  set setEstoquista(int estoquista) => this.estoquista = estoquista;

  int get getQtdSolicitado => qtdSolicitado;

  set setQtdSolicitado(int qtdSolicitado) => this.qtdSolicitado = qtdSolicitado;

  int get getQtdAtendida => qtdAtendida;

  set setQtdAtendida(int qtdAtendida) => this.qtdAtendida = qtdAtendida;

  bool get getStatusRepositor => statusRepositor;

  set setStatusRepositor(bool statusRepositor) =>
      this.statusRepositor = statusRepositor;

  bool get getStatusEstoquista => statusEstoquista;

  set setStatusEstoquista(bool statusEstoquista) =>
      this.statusEstoquista = statusEstoquista;

  DateTime get getDataSolicitacao => dataSolicitacao;

  set setDataSolicitacao(DateTime dataSolicitacao) =>
      this.dataSolicitacao = dataSolicitacao;

  DateTime get getDataAtendido => dataSolicitacao;

  set setDataAtendido(DateTime dataAtendido) =>
      this.dataSolicitacao = dataAtendido;

  void setUserId(int id) {
    this.id = id;
  }

  ColetaReposicao.repositor(this.repositor, this.produto, this.qtdSolicitado);
  ColetaReposicao.estoquista(this.estoquista, this.qtdAtendida);

  void criarListaProdutoReposicaoRepositor(String produto, int qtdSolicitado) {
    CapDate dataAgora = new CapDate();
    this.dataSolicitacao = dataAgora.tempo();
  }

  ColetaReposicao.map(dynamic obj) {
    this.id = obj["id"];
    this.repositor = obj["repositor"];
    this.produto = obj["produto"];
    this.qtdSolicitado = obj["qtdSolicitado"];
    this.estoquista = obj["estoquista"];
    this.qtdAtendida = obj["qtdAtendida"];
    this.statusRepositor = obj["statusRepositor"];
    this.statusEstoquista = obj["statusEstoquista"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map["id"] = id;
    }
    map["repositor"] = repositor;
    map["produto"] = produto;
    map["qtdSolicitado"] = qtdSolicitado;
    map["dataSolicitacao"] = dataSolicitacao;
    map["estoquista"] = estoquista;
    map["qtdAtendida"] = qtdAtendida;
    map["statusRepositor"] = statusRepositor;
    map["statusEstoquista"] = statusEstoquista;
    return map;
  }

  ColetaReposicao.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.repositor = map['repositor'];
    this.produto = map['produto'];
    this.qtdSolicitado = map['qtdSolicitado'];
    this.estoquista = map['Estoquista'];
    this.qtdAtendida = map['qtdAtendida'];
    this.statusRepositor = map['statusRepositor'];
    this.statusEstoquista = map['statusEstoquista'];
  }
}
