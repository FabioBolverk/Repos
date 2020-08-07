import 'dart:io' as io;
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_repo/Model/ColetaReposicao.dart';

class ColetaReposicaoDb {
  static final ColetaReposicaoDb _instance = new ColetaReposicaoDb.internal();
  factory ColetaReposicaoDb() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  ColetaReposicaoDb.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY,repositor INTEGER,produto TEXT,qtdSolicitado INTEGER, dataSolicitacao DATE, estoquista INTEGER, qtdAtendida INTEGER, statusRepositor BOOLEAN, statusEstoquista BOOLEAN)");
  }

  Future<int> saveUser(ColetaReposicao user) async {
    var dbColetaRepo = await db;
    int res = await dbColetaRepo.insert("User", user.toMap());
    return res;
  }

  //Retorna contato por id, pesquisando na lista de contatos
  Future<List<ColetaReposicao>> getUser() async {
    var dbColetaRepo = await db;
    List<Map> list = await dbColetaRepo.rawQuery('SELECT * FROM User');
    List<ColetaReposicao> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user = new ColetaReposicao(
          list[i]["id"],
          list[i]["repositor"],
          list[i]["produto"],
          list[i]["qtdSolicitado"],
          list[i]["dataSolicitacao"],
          list[i]["estoquista"],
          list[i]["qtdAtendida"],
          list[i]["statusRepositor"],
          list[i]["statuEstoquista"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(ColetaReposicao user) async {
    var dbColetaRepo = await db;

    int res = await dbColetaRepo
        .rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    return res;
  }

  Future<bool> update(ColetaReposicao user) async {
    var dbColetaRepo = await db;
    int res = await dbColetaRepo.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.id]);
    return res > 0 ? true : false;
  }
}
