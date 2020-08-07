import 'dart:io' as io;
import 'dart:async';
import 'package:app_repo/Model/Estoquista.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_repo/Model/Corredor.dart';


  class CorredorDb {
  static final CorredorDb _instance = new CorredorDb.internal();
  factory CorredorDb() => _instance;
  static Database _db;
  

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

CorredorDb.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Corredor(id INTEGER PRIMARY KEY, empresa TEXT, iedntificador TEXT, descricao TEXT)");
  }

  Future<int> saveUser(Estoquista user) async {
    var dbCorredor = await db;
    int res = await dbCorredor.insert("User", user.toMap());
    return res;
  }
  //Retorna contato por id, pesquisando na lista de contatos
  Future<List<Corredor>> getUser() async {
    var dbCorredor = await db;
    List<Map> list = await dbCorredor.rawQuery('SELECT * FROM User');
    List<Corredor> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
          new Corredor(list[i]["id"], list[i]["empresa"], list[i]["identificador"], list[i]["descricao"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(Corredor user) async {
    var dbCorredor = await db;

    int res =
        await dbCorredor.rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    return res;
  }

  Future<bool> update(Corredor user) async {
    var dbCorredor = await db;
    int res =   await dbCorredor.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.id]);
    return res > 0 ? true : false;
  }


}