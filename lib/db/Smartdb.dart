import 'dart:io' as io;
import 'dart:async';
import 'package:app_repo/Model/Smart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



  class SmartDb {
  static final SmartDb _instance = new SmartDb.internal();
  factory SmartDb() => _instance;
  static Database _db;
  

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  SmartDb.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Smart(id INTEGER PRIMARY KEY, codRegistro INTEGER, descricao TEXT, repositor INTEGER, estoquista INTEGER)");
  }

  Future<int> saveUser(Smart user) async {
    var dbSmart = await db;
    int res = await dbSmart.insert("User", user.toMap());
    return res;
  }
  //Retorna contato por id, pesquisando na lista de contatos
  Future<List<Smart>> getUser() async {
    var dbSmart = await db;
    List<Map> list = await dbSmart.rawQuery('SELECT * FROM User');
    List<Smart> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
          new Smart(list[i]["id"], list[i]["empresa"], list[i]["codRegistro"], list[i]["descricao"],
          list[i]["repositor"], list[i]["estoquista"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(Smart user) async {
    var dbSmart = await db;

    int res =
        await dbSmart.rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    return res;
  }

  Future<bool> update(Smart user) async {
    var dbSmart = await db;
    int res =   await dbSmart.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.id]);
    return res > 0 ? true : false;
  }


}