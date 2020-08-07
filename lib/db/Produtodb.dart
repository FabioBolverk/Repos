import 'dart:io' as io;
import 'dart:async';
import 'package:app_repo/Model/Estoquista.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_repo/Model/Produto.dart';


  class ProdutoDb {
  static final ProdutoDb _instance = new ProdutoDb.internal();
  factory ProdutoDb() => _instance;
  static Database _db;
  

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

    ProdutoDb.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Produto(id INTEGER PRIMARY KEY, nome TEXT, empresa TEXT, gondola INTEGER, codInterno INTEGER, codBarra INTEGER, descricao TEXT, undMedida TEXT, precoVenda REAL, foto TEXT, dataAtualizacao Date )");
  }

  Future<int> saveUser(Produto user) async {
    var dbProduto = await db;
    int res = await dbProduto.insert("User", user.toMap());
    return res;
  }
  //Retorna contato por id, pesquisando na lista de contatos
  Future<List<Produto>> getUser() async {
    var dbProduto = await db;
    List<Map> list = await dbProduto.rawQuery('SELECT * FROM User');
    List<Produto> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
          new Produto(list[i]["id"], list[i]["nome"], list[i]["empresa"],list[i]["gondola"],list[i]["codInterno"],
          list[i]["codBarra"],list[i]["descricao"],list[i]["undMedida"], list[i]["precoVenda"],list[i]["foto"],
          list[i]["dataAtualizacao"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(Produto user) async {
    var dbProduto = await db;

    int res =
        await dbProduto.rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    return res;
  }

  Future<bool> update(Produto user) async {
    var dbProduto = await db;
    int res =   await dbProduto.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.id]);
    return res > 0 ? true : false;
  }


}