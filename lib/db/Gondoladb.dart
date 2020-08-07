import 'dart:io' as io;
import 'dart:async';
import 'package:app_repo/Model/Estoquista.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_repo/Model/Gondola.dart';


  class GondolaDb {
  static final GondolaDb _instance = new GondolaDb.internal();
  factory GondolaDb() => _instance;
  static Database _db;
  

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  GondolaDb.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Gondola(id INTEGER PRIMARY KEY, idQuadra INTEGER, identificador TEXT, descricao TEXT)");
  }

  Future<int> saveUser(Gondola user) async {
    var dbGondola = await db;
    int res = await dbGondola.insert("User", user.toMap());
    return res;
  }
  //Retorna contato por id, pesquisando na lista de contatos
  Future<List<Gondola>> getUser() async {
    var dbGondola = await db;
    List<Map> list = await dbGondola.rawQuery('SELECT * FROM User');
    List<Gondola> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
          new Gondola(list[i]["id"], list[i]["idQuadra"], list[i]["identificador"], list[i]["descricao"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(Gondola user) async {
    var dbEstoquista = await db;

    int res =
        await dbEstoquista.rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    return res;
  }

  Future<bool> update(Gondola user) async {
    var dbGondola = await db;
    int res =   await dbGondola.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.id]);
    return res > 0 ? true : false;
  }


}