import 'dart:async';

import 'package:app_repo/Model/Repositor.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBaseRef {
  DatabaseReference _userRef;
  StreamSubscription<Event> _massageSubscription;
  FirebaseDatabase _database = new FirebaseDatabase();
  DatabaseError error;

  static final DataBaseRef _instance = new DataBaseRef.internal();

  DataBaseRef.internal();
  factory DataBaseRef() {
    return _instance;
  }

  void initState() {
    _userRef = _database.reference().child("Users");
    _database.setPersistenceEnabled(true);
    _database.setPersistenceCacheSizeBytes(1024 * 1000000);
  }

  DatabaseError getError() {
    return error;
  }

  DatabaseReference getUserRef() {
    return _userRef;
  }

  addUser(Repositor repo) async {
    _userRef.push().set(<String, String>{
      "cpf": repo.cpf,
      "nome": repo.nome,
      "senha": repo.senha,
    }).then((_) {
      print("sucess");
    });
  }

  adicionarUser(Repositor repo) async {
    _userRef = _database.reference().child(repo.cpf);
    _userRef.push().set(repo.toMapCadRepositor()).then((_) {
      print("Add Sucess");
      print("addUser");
    });
  }

  adicionarUser2(Repositor repo) async {
    //var result = await repo.toMapCadRepositor();
    _userRef = _database.reference().child(repo.cpf);
    var result = await repo.toMapCadRepositor();
    _userRef.push().set(result);
  }

  /*adicionarUser3(Repositor repo) async {
    repo.toMapCadRepositor().then( (value) => _userRef.push().set(value);
  }*/

  void deleteUser(Repositor repo) async {
    await _userRef.child(repo.cpf).remove().then((_) {
      print("Delete Sucess");
    });
  }

  void atualizar(Repositor repo) async {
    var update = Map<String, String>();
    update.putIfAbsent("senha", () => repo.senha);
    update.putIfAbsent("nome", () => repo.nome);
    await _userRef.child(repo.cpf).update(update).then((_) {
      print("Update Sucess");
    });
  }

  void dispose() {
    _massageSubscription.cancel();
  }
}
