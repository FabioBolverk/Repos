import 'dart:async';
import 'package:app_repo/Model/Repositor.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RepositorData2 {
  Database database;

  final String tabelaRepositor = "tabelaRepositor";
  final String colunaId = "id";
  final String colunaCpf = "cpf";
  //final String colunaSmartfone = "smartfone";
  final String colunaNome = "nome";
  // final String colunaFuncao = "funcao";
  // final String colunaDataCad = "cadastro";
  // final String colunaStatus = "status";
  // final String colunaDataInatividade = "inatividade";
  final String colunaSenha = "senha";

  abrirDb() async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'app.db'),
    );
  }

  void criarTabela() async {
    // Open the database and store the reference.
    Future<Database> database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'app.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE TabRepositor(id INTEGER PRIMARY KEY, cpf TEXT, nome TEXT, senha TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insert(Repositor repositor) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'TabRepositor',
      repositor.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
