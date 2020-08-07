import 'dart:io' as io;
import 'dart:async';
import 'package:app_repo/Model/Estoquista.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



  class EstoquistaDb {
  static final EstoquistaDb _instance = new EstoquistaDb.internal();
  factory EstoquistaDb() => _instance;
  static Database _db;
  

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

EstoquistaDb.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Estoquista(id INTEGER PRIMARY KEY, nome TEXT, numCel TEXT)");
  }

  Future<int> saveUser(Estoquista user) async {
    var dbEstoquista = await db;
    int res = await dbEstoquista.insert("User", user.toMap());
    return res;
  }
  //Retorna contato por id, pesquisando na lista de contatos
  Future<List<Estoquista>> getUser() async {
    var dbEstoquista = await db;
    List<Map> list = await dbEstoquista.rawQuery('SELECT * FROM User');
    List<Estoquista> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
          new Estoquista(list[i]["id"], list[i]["nome"], list[i]["numCel"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(Estoquista user) async {
    var dbEstoquista = await db;

    int res =
        await dbEstoquista.rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    return res;
  }

  Future<bool> update(Estoquista user) async {
    var dbEstoquista = await db;
    int res =   await dbEstoquista.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.id]);
    return res > 0 ? true : false;
  }


}