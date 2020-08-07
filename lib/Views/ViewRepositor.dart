import 'package:flutter/material.dart';
import 'package:app_repo/Model/Repositor.dart';
import 'package:app_repo/Model/ColetaReposicao.dart';
import 'package:app_repo/Model/ColetaValidade.dart';
import 'package:app_repo/Model/Produto.dart';
import 'package:app_repo/dataBase/RepositorData.dart';
import 'package:app_repo/Model/QrCode.dart';
import 'package:app_repo/dataBase/ColetaRepoData.dart';

class TelaRepositor extends StatefulWidget {
  @override
  _TelaRepositorState createState() => _TelaRepositorState();
}

class _TelaRepositorState extends State<TelaRepositor> {
  bool _isVisivel = false;
  bool get getIsVisivel => _isVisivel;
  set setIsVisivel(bool _isVisivel) => this._isVisivel = _isVisivel;
  final _pedidosRepositor = TextEditingController();
  final _qtdRepositor = TextEditingController();
  bool _valor1 = false;
  bool _valor2 = false;
  Repositor _repositor;
  //RepositorData repositorData;
  ColetaRepoData coletaRepoData;
  ColetaReposicao coletaReposicao;
  QrCode qrcodeScan;
  String _codeQr;
  bool _leituraQrAtivada = false;
  int qtd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              SizedBox(
                width: 100,
                height: 50,
                child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _repositor.rotaIniciada = true;
                      _repositor.iniciarRota();
                    });
                  },
                  child: Text("Iniciar Rota"),
                  textColor: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(10),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _repositor.finalizarRota();
                    });
                  },
                  child: Text("Finalizar Rota"),
                  textColor: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(5),
                ),
              ),
            ]),

            Padding(padding: EdgeInsets.all(10)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              SizedBox(
                width: 100,
                height: 50,
                child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text("Etiqueta"),
                  textColor: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(10),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      this._leituraQrAtivada = true;
                      this.qrcodeScan = new QrCode();
                      qrcodeScan.scanQr();
                      this._codeQr = qrcodeScan.code;
                    });
                  },
                  child: Text("Ler QrCode"),
                  textColor: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(10),
                ),
              ),
            ]),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Checkbox(
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                  onChanged: (bool resp) {
                    setState(() {
                      _valor1 = resp;
                      if (_valor2 == true) {
                        _valor1 = false;
                      }
                    });
                  },
                  value: _valor1,
                ),
                new Text("Reposição",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                new Checkbox(
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                  onChanged: (bool resp) {
                    setState(() {
                      _valor2 = resp;
                      if (_valor1 == true) {
                        _valor2 = false;
                      }
                    });
                  },
                  value: _valor2,
                ),
                new Text("Validade",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),

            Padding(padding: EdgeInsets.all(5)),
            SizedBox(
                //botão exibit titulo tabela
                width: double.infinity, // match_parent
                child: RaisedButton(
                  onPressed: () => {
                    setState(() {
                      _isVisivel = true;
                    }),
                  },
                  child: Text(
                    "Criar Lista de Pedidos",
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ), //text
                  color: Colors.white,
                )),
            Container(
              color: Colors.white,
              child: Visibility(
                visible: _isVisivel,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: _pedidosRepositor,
                      decoration: InputDecoration(
                          labelText: 'Lista de Produtos:',
                          labelStyle: new TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      keyboardType: TextInputType.text,
                      //maxLines: null,
                      style: new TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: _qtdRepositor,
                      decoration: InputDecoration(
                          labelText: 'Quantidade Produtos:',
                          labelStyle: new TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      keyboardType: TextInputType.number,
                      //maxLines: null,
                      style: new TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),

            //---botão-----\/
            ButtonTheme(
              height: 50.0,
              child: RaisedButton(
                color: Colors.white,
                child: Text(
                  "Enviar",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        new BorderRadius.circular(30.0)), //CircleBorder(),
                onPressed: () {
                  setState(() {
                    this.qtd = int.parse(_repositor.id);
                    if (_valor1 = true &&
                        _repositor.rotaIniciada == true &&
                        _leituraQrAtivada == true) {
                      int qtd = int.parse(_qtdRepositor.text);
                      this.coletaReposicao =
                          new ColetaReposicao.repositor(this.qtd, _codeQr, qtd);

                      this.coletaRepoData = new ColetaRepoData();
                      coletaRepoData.inserir(coletaReposicao);
                    } else if (_valor1 = true &&
                        _repositor.rotaIniciada == true &&
                        _leituraQrAtivada == false) {
                      int qtd = int.parse(_qtdRepositor.text);
                      this.coletaReposicao = new ColetaReposicao.repositor(
                          qtd, _pedidosRepositor.text, qtd);
                      coletaRepoData.inserir(coletaReposicao);
                      this.coletaRepoData = new ColetaRepoData();
                      coletaRepoData.inserir(coletaReposicao);
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
