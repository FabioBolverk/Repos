import 'package:app_repo/Model/CapDate.dart';

import 'ColetaReposicao.dart';
import 'CapDate.dart';

class Estoquista {
  String nome;
  int id;
  String numCel;
  DateTime horaInicial;
  DateTime horaFinal;
  String inatividade;
  String senha;
  ColetaReposicao _coletaReposicao;

  String get getSenha => senha;

  set setSenha(String senha) => this.senha = senha;

  String get getNome => nome;

  set setNome(String nome) => this.nome = nome;

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getNumCel => numCel;

  set setNumCel(String numCel) => this.numCel = numCel;
  String get getInatividade => inatividade;

  set setInatividade(String inatividade) => this.inatividade = inatividade;

  Estoquista(this.nome, this.id, this.numCel);

  void visualizarListaPedido(ColetaReposicao cr) {
    cr.getProduto;
    cr.getQtdSolicitado;
  }

  void pegarItemPedido() {}

  bool disponivel(bool disponibilidade) {
    if (disponibilidade == true) {
      this.finalizar();
      return true;
    } else {
      this.iniciar();
      return false;
    }
  }

  void iniciar() {
    CapDate dataAgora = new CapDate();
    this.horaInicial = dataAgora.hora();
  }

  void finalizar() {
    CapDate dataAgora = new CapDate();
    this.horaFinal = dataAgora.hora();
    Duration duracInatividade = horaInicial.difference(horaFinal);
    assert(duracInatividade.inMinutes == 59);
    this.inatividade = duracInatividade.toString();
  }

  void setUserId(int id) {
    this.id = id;
  }

  void PegarListaProdutoReposicaoEstoquista(int qtd) async {
    _coletaReposicao = new ColetaReposicao.estoquista(this.id, qtd);
    CapDate dataAgora = await new CapDate();
    _coletaReposicao.dataAtendida = dataAgora.tempo();
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'numCel': numCel,
      'horaInicial': horaInicial,
      'horaFinal': horaFinal,
      'inatividade': inatividade,
      'senha': senha,
    };
    return map;
  }

  Estoquista.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    numCel = map['numCel'];
    horaInicial = map['horaInicial'];
    horaFinal = map['horaFinal'];
    inatividade = map['inatividade'];
    senha = map['senha'];
  }
}
