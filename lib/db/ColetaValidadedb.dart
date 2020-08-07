import 'dart:io' as io;
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_repo/Model/ColetaValidade.dart';


  class ColetaValidadeDb {
  static final ColetaValidadeDb _instance = new ColetaValidadeDb.internal();
  factory ColetaValidadeDb() => _instance;
  static Database _db;
  

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  ColetaValidadeDb.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, repositor INTEGER, qtdVencida INTEGER, data DATE)");
  }

  Future<int> saveUser(ColetaValidade user) async {
    var dbColetaValidade = await db;
    int res = await dbColetaValidade.insert("User", user.toMap());
    return res;
  }
  //Retorna contato por id, pesquisando na lista de contatos
  Future<List<ColetaValidade>> getUser() async {
    var dbColetaValidade = await db;
    List<Map> list = await dbColetaValidade.rawQuery('SELECT * FROM User');
    List<ColetaValidade> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
          new ColetaValidade(list[i]["id"], list[i]["repositor"], list[i]["produto"], list[i]["qtdVencida"],
          list[i]["data"],list[i]["status"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(ColetaValidade user) async {
    var dbColetaValidade = await db;

    int res =
        await dbColetaValidade.rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    return res;
  }

  Future<bool> update(ColetaValidade user) async {
    var dbColetaValidade = await db;
    int res =   await dbColetaValidade.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.id]);
    return res > 0 ? true : false;
  }


}