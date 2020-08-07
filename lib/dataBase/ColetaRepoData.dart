import 'dart:async';
import 'dart:io';
import 'package:app_repo/Model/ColetaReposicao.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ColetaRepoData {
  static final ColetaRepoData _instance = new ColetaRepoData.internal();

  factory ColetaRepoData() => _instance;
  final String tabelaColetaReposicao = "ColetaReposicao";
  final String colunaId = "id";
  final String colunaRepositor = "repositor"; //obj
  final String colunaProduto = "produto";
  final String colunaQtdSolicitado = "qtdSolicitado";
  final String colunaDataSolicitacao = "datSolicitacao";
  final String colunaEstoquista = "estoquista"; //obj
  final String colunaQtdAtendida = "qtdAtendida";
  final String colunaStatusRepositor = "statusRepositor"; //bool
  final String colunaStatusEstoquista = "statusEstoquista"; //bool

  static Database _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  ColetaRepoData.internal();

  initDb() async {
    Directory documentoDiretorio = await getApplicationDocumentsDirectory();
    String caminho = join(documentoDiretorio.path, "RepoDevel.db");
    var RepoDb = await openDatabase(caminho,
        version: 1, onCreate: _onCreate); //RepoDb é a var q chama o banco
    return RepoDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tabelaColetaReposicao($colunaId INTEGER PRIMARY KEY,"
        "$colunaRepositor TEXT,"
        "$colunaProduto TEXT,"
        "$colunaQtdSolicitado TEXT,"
        "$colunaDataSolicitacao TEXT"
        "$colunaEstoquista TEXT,"
        "$colunaQtdAtendida TEXT,"
        "$colunaStatusRepositor TEXT,"
        "$colunaStatusEstoquista TEXT)");
  }

  //Inserir
  Future<int> inserir(ColetaReposicao coletaRepo) async {
    var dbRepositor = await database;
    int resultado =
        await dbRepositor.insert("$tabelaColetaReposicao", coletaRepo.toMap());
    return resultado;
  }
}
