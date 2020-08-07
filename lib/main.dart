import 'package:app_repo/Views/CadastroView.dart';
import 'package:app_repo/Views/ViewRepositor.dart';
import 'package:app_repo/Views/tViews.dart';
import 'package:flutter/material.dart';
import 'package:app_repo/Views/LoginView.dart';
import 'package:app_repo/Views/RecuperarSenhaView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //banner debug
      title: 'texte',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: loginPage(), //TelaRepositor(), // CadastroPage(),
    ); //materialApp
  }
}
