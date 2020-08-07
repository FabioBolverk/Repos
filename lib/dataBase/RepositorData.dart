import 'dart:async';
import 'dart:io';
import 'package:app_repo/Model/Repositor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RepositorData {
  static final RepositorData _instance = new RepositorData.internal();

  factory RepositorData() => _instance;

  final String tabelaRepositor = "tabelaRepositor";
  final String colunaId = "id";
  final String colunaCpf = "cpf";
  final String colunaNome = "nome";
  final String colunaSenha = "senha";
  var repoDb;

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  RepositorData.internal();

  initDb() async {
    Directory documentoDiretorio = await getApplicationDocumentsDirectory();
    String caminho = join(documentoDiretorio.path, "appBanco.db");
    this.repoDb = await openDatabase(caminho, version: 1, onCreate: _onCreate);
    print("----------InitDB-----");
    return repoDb;
  }

  void _onCreate(Database db, int version) async {
    //try {
    await db
        .execute('CREATE TABLE $tabelaRepositor($colunaId INTEGER PRIMARY KEY,'
            '$colunaCpf TEXT,'
            '$colunaNome TEXT,'
            '$colunaSenha TEXT)');
    print("------CREATE-----");
    // } catch (e) {
    //  print("erro CREATE $e");
    // }
  }

  //Inserir
  Future<int> inserir(Repositor repositor) async {
    print("----------insert-----");
    var dbRepositor = await database;
    int resultado = await dbRepositor.insert(
        '$tabelaRepositor', repositor.toMapCadRepositor());
    return resultado;
  }

  //PegarTodos
  Future<List> pegarTodosRepositor(Repositor repositor) async {
    var dbRepositor = await database;
    var resultado =
        await dbRepositor.rawQuery('SELECT * FROM $tabelaRepositor');

    return resultado.toList();
  }

  //Quantidade
  Future<int> quantidade() async {
    var dbRepositor = await database;
    return Sqflite.firstIntValue(
        await dbRepositor.rawQuery("SELECT COUNT(*) FROM $tabelaRepositor"));
  }

  //Pegar por CPF
  Future<Repositor> pegarRepositor(String cpf) async {
    var dbRepositor = await database;
    var resultado = await dbRepositor.rawQuery('SELECT * FROM $tabelaRepositor'
        'WHERE $colunaCpf = $cpf');
    if (resultado.length == 0) return null;
    return new Repositor.fromMap(resultado.first);
  }

  //Deletar
  Future<int> deletar(int cpf) async {
    var dbRepositor = await database;
    return await dbRepositor
        .delete(tabelaRepositor, where: "$colunaCpf = ?", whereArgs: [cpf]);
  }

  //Atualizar
  Future<int> atualizar(Repositor repositor) async {
    var dbRepositor = await database;
    return await dbRepositor.update(
        tabelaRepositor, repositor.toMapCadRepositor(),
        where: "$colunaCpf = ?", whereArgs: [repositor.cpf]);
  }

  Future fechar() async {
    var dbRepositor = await database;
    return dbRepositor.close();
  }
}
