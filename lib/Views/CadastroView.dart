import 'package:app_repo/Views/LoginView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_repo/Model/Repositor.dart';
import 'package:app_repo/Model/Estoquista.dart';
import 'package:app_repo/db/EstoquistaDb.dart';
import 'package:app_repo/dataBase/RepositorFireBase.dart';
import 'package:app_repo/dataBase/RepositorData.dart';
import 'ViewRepositor.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  int valorSelecionado;
  Repositor repositor;
  RepositorData repositorDb;
  DataBaseRef baseRepo;
  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final senhaController = TextEditingController();
  final confSenhaController = TextEditingController();

  /*criarNovoUser(String nome, String cpf, String senha) async {
    this.repositorDb = new RepositorData();
    this.repositor = new Repositor(nome, cpf, senha);
    await this.repositorDb.inserir(repositor);
  }*/
  CadastroPageState() {
    this.baseRepo = new DataBaseRef();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //larguda da pagina
            mainAxisAlignment: MainAxisAlignment.center, // centralizadonapagina
            children: <Widget>[
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                controller: cpfController,
                style: new TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "CPF",
                  labelStyle: new TextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                controller: nomeController,
                style: new TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: new TextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              TextFormField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                controller: senhaController,
                style: new TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: new TextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              TextFormField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                controller: confSenhaController,
                style: new TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Repita a senha",
                  labelStyle: new TextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              RadioListTile(
                  activeColor: Colors.black,
                  value: 0,
                  groupValue: valorSelecionado,
                  title: Text("Repositor",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  onChanged: (valor) {
                    setState(() {
                      valorSelecionado = valor;
                    });
                  }),
              RadioListTile(
                  activeColor: Colors.black,
                  value: 1,
                  groupValue: valorSelecionado,
                  title: Text("Estoquista",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  onChanged: (valor) {
                    setState(() {
                      valorSelecionado = valor;
                    });
                  }),
              Divider(),
              ButtonTheme(
                height: 40.0,
                child: RaisedButton(
                  onPressed: () => {
                    setState(() {
                      if (this.valorSelecionado == 0 &&
                          senhaController.text == confSenhaController.text) {
                        this.repositor = new Repositor(nomeController.text,
                            cpfController.text, senhaController.text);
                        this.baseRepo.adicionarUser2(repositor);
                        /*this.criarNovoUser(nomeController.text,
                            cpfController.text, senhaController.text),*/
                        SnackBar(
                          content: Text("Cadastro Realizado!"),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => loginPage()),
                        );
                      }
                    }),
                  },

                  child: Text(
                    "Gravar",
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ), //text
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
