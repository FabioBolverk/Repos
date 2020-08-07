import 'package:app_repo/Model/CapDate.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Produto.dart';
import 'ColetaReposicao.dart';
import 'CapDate.dart';
import 'ColetaValidade.dart';
import 'Smart.dart';

class Repositor {
  bool _pedidoEtiqueta;
  ColetaReposicao _coletaReposicao;
  ColetaValidade _coletaValidade;
  String nome; //ok
  String id; //ok
  String cpf;
  bool funcao; //ok
  String numCel;
  DateTime horaInicial;
  DateTime horaFinal;
  DateTime dataCad; //ok
  String inatividade; //ok
  String senha;
  String confSenha;
  bool rotaIniciada;
  String smartfone;

  String get getSmartfone => smartfone;

  set setSmartfone(String smartfone) => this.smartfone = smartfone; //ok

  bool get getRotaIniciada => rotaIniciada;

  set setRotaIniciada(bool rotaIniciada) => this.rotaIniciada = rotaIniciada;

  String get getSenha => senha;

  set setSenha(String senha) => this.senha = senha;

  bool get pedidoEtiqueta => _pedidoEtiqueta;

  set pedidoEtiqueta(bool value) => _pedidoEtiqueta = value;

  String get getNome => nome;

  set setNome(String nome) => this.nome = nome;

  String get getId => id;

  set setId(String id) => this.id = id;

  String get getCpf => cpf;

  set setCpf(String cpf) => this.cpf = cpf;

  String get getNumCel => numCel;

  set setNumCel(String numCel) => this.numCel = numCel;

  String get getInatividade => inatividade;

  set setInatividade(String inatividade) => this.inatividade = inatividade;

  Repositor(this.nome, this.cpf, this.senha); //construtor

  void criarListaProdutoValidade(String produto, int qtd) async {
    _coletaReposicao.setProduto = await produto;
    _coletaReposicao.setQtdSolicitado = await qtd;
    CapDate dataAgora = await new CapDate();
    dataAgora.tempo();
    _coletaReposicao.setDataSolicitacao = await dataAgora.getTempoCapturado;
    _coletaReposicao.setRepositor = int.parse(this.id);
  }

  bool disponivel(bool disponibilidade) {
    if (disponibilidade == true) {
      this.iniciarRota();
      return true;
    } else {
      this.finalizarRota();
      return false;
    }
  }

  bool PedirEtiqueta(bool etiqueta) {
    this._pedidoEtiqueta = etiqueta;

    return _pedidoEtiqueta;
  }

  void visualizarRota() {}

  void iniciarRota() {
    CapDate dataAgora = new CapDate();
    this.horaInicial = dataAgora.hora();
  }

  void finalizarRota() {
    CapDate dataAgora = new CapDate();
    this.horaFinal = dataAgora.hora();
    Duration duracInatividade = horaInicial.difference(horaFinal);
    assert(duracInatividade.inMinutes == 59);
    this.inatividade = duracInatividade.toString();
  }

  void setUserId(String id) {
    this.id = id;
  }

  Repositor.fromSnapshot(DataSnapshot snapshot) {
    id = snapshot.key;
    cpf = snapshot.value(cpf);
    nome = snapshot.value(nome);
    senha = snapshot.value(senha);
  }

  Repositor.map(dynamic obj) {
    this.id = obj["id"];
    this.cpf = obj["cpf"];
    // this.smartfone = obj["smartfone"];
    this.nome = obj["nome"];
    // this.funcao = obj["funcao"];
    // this.dataCad = obj["dataCad"];
    // this.inatividade = obj["status"];
    this.senha = obj["senha"];
  }

  Map<String, dynamic> toMapCadRepositor() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map["id"] = id;
    }
    map["cpf"] = cpf;
    map["nome"] = nome;
    map["senha"] = senha;
    // map["smartfone"] = smartfone;
    // map["funcao"] = funcao;
    // map["dataCad"] = dataCad;
    // map["status"] = inatividade;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "cpf": cpf,
      "nome": nome,
      "senha": senha,
      // map["smartfone"] = smartfone;
      // map["funcao"] = funcao;
      // map["dataCad"] = dataCad;
      // map["status"] = inatividade;
    };
  }

  Repositor.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.cpf = map['cpf'];
    //this.smartfone = map['smartfone'];
    this.nome = map['nome'];
    // this.funcao = map['funcao'];
    // this.dataCad = map['dataCad'];
    // this.inatividade = map['status'];
    this.senha = map['senha'];
  }
}
