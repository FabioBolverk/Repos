import 'dart:io' as io;
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_repo/Model/Empresa.dart';



  class EmpresaDb {
  static final EmpresaDb _instance = new EmpresaDb.internal();
  factory EmpresaDb() => _instance;
  static Database _db;
  

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

EmpresaDb.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Enpresa(id INTEGER PRIMARY KEY, razaoSocial TEXT, fantasia TEXT, cnpj TEXT, inscEstadual TEXT,cep TEXT,logradouro TEXT,complemento TEXT,numero TEXT,bairro TEXT,cidade TEXT, estado TEXT,telefone TEXT,email TEXT)"     
        );
  }

  Future<int> saveUser(Empresa user) async {
    var dbEmpresa = await db;
    int res = await dbEmpresa.insert("User", user.toMap());
    return res;
  }
  //Retorna contato por id, pesquisando na lista de contatos
  Future<List<Empresa>> getUser() async {
    var dbEmpresa = await db;
    List<Map> list = await dbEmpresa.rawQuery('SELECT * FROM User');
    List<Empresa> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
          new Empresa(list[i]["idEmpresa"], list[i]["razaoSocial"], list[i]["fantasia"], list[i]["cnpj"], 
          list[i]["inscEstadual"], list[i]["cep"], list[i]["logradouro"], list[i]["complemento"],
           list[i]["numero"], list[i]["bairro"], list[i]["cidade"], list[i]["estado"], list[i]["telefone"],
            list[i]["email"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(Empresa user) async {
    var dbEmpresa = await db;

    int res =
        await dbEmpresa.rawDelete('DELETE FROM User WHERE id = ?', [user.idEmpresa]);
    return res;
  }

  Future<bool> update(Empresa user) async {
    var dbEmpresa = await db;
    int res =   await dbEmpresa.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.idEmpresa]);
    return res > 0 ? true : false;
  }


}