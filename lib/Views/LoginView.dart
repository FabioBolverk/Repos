import 'package:app_repo/Views/CadastroView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_repo/Model/Repositor.dart';
import 'package:app_repo/dataBase/RepositorData.dart';

import 'ViewRepositor.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  Repositor _repositor;
  RepositorData _repositorData;
  final _cpfController = TextEditingController(); //cpf
  final _senhaController = TextEditingController();
  String teste;

  set setNumCel(String repositor) => this._repositor = _repositor;

  String get repositor => repositor;

  loginPageState() {
    this._repositorData = new RepositorData();
  }

  pegarUser(String cpf, String senha) async {
    this._repositor = await this._repositorData.pegarRepositor(cpf);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //larguda da pagina
            mainAxisAlignment: MainAxisAlignment.center, // centralizadonapagina
            children: <Widget>[
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                controller: _cpfController,
                style: new TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Login",
                  labelStyle: new TextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              TextFormField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                controller: _senhaController,
                style: new TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: new TextStyle(color: Colors.white),
                ), //textField
              ), //decoration
              Divider(),
              ButtonTheme(
                height: 40.0,
                child: RaisedButton(
                  onPressed: () => {
                    pegarUser(_cpfController.text, _senhaController.text),
                    if (this._repositor.cpf == _cpfController.text &&
                        this._repositor.senha == _senhaController.text)
                      {
                        SnackBar(
                          content: Text("Bem Vindo!"),
                        ),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaRepositor()),
                        ),
                      }
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ), //text
                  color: Colors.white,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 100,
                  height: 80,
                  child: FlatButton(
                      child: Text(
                        "Cadastrar",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CadastroPage()),
                        );
                      }),
                ),
                SizedBox(
                  width: 100,
                  height: 80,
                  child: FlatButton(
                      child: Text(
                        "Recuperar",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {}),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
