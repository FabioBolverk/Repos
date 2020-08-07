import 'dart:io' as io;
import 'dart:async';
import 'package:app_repo/Model/Estoquista.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_repo/Model/Quadra.dart';


  class QuadraDb {
  static final QuadraDb _instance = new QuadraDb.internal();
  factory QuadraDb() => _instance;
  static Database _db;
  

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

QuadraDb.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Quadra (id INTEGER PRIMARY KEY, idCorredor INTEGER, numCel TEXT)");
  }

  Future<int> saveUser(Estoquista user) async {
    var dbQuadra = await db;
    int res = await dbQuadra.insert("User", user.toMap());
    return res;
  }
  //Retorna contato por id, pesquisando na lista de contatos
  Future<List<Quadra>> getUser() async {
    var dbQuadra = await db;
    List<Map> list = await dbQuadra.rawQuery('SELECT * FROM User');
    List<Quadra> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
          new Quadra(list[i]["id"], list[i]["idCorredor"], list[i]["identificador"], list[i]["descricao"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(Quadra user) async {
    var dbEstoquista = await db;

    int res =
        await dbEstoquista.rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    return res;
  }

  Future<bool> update(Quadra user) async {
    var dbQuadra = await db;
    int res =   await dbQuadra.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.id]);
    return res > 0 ? true : false;
  }


}