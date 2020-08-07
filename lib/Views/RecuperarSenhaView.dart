
import 'package:flutter/material.dart';


class RecuperarPage extends StatefulWidget {
  @override
  _RecuperarPageState createState() => _RecuperarPageState();
}

class _RecuperarPageState extends State<RecuperarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Padding(
        padding: EdgeInsets.all(10),
      child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, //larguda da pagina
        mainAxisAlignment: MainAxisAlignment.center,  // centralizadonapagina
        children: <Widget>[
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.number,
            style: new TextStyle(color:Colors.white, fontSize: 20),
            decoration: InputDecoration(
              labelText: "CPF",
             labelStyle: new TextStyle(color: Colors.white),
            ),
          ),
          Divider(),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.text,
            style: new TextStyle(color:Colors.white, fontSize: 20),
            decoration: InputDecoration(
              labelText: "Nova senha",
             labelStyle: new TextStyle(color: Colors.white),
            ),
          ),
          Divider(),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.text,
            style: new TextStyle(color:Colors.white, fontSize: 20),
            decoration: InputDecoration(
              labelText: " Repita a senha",
             labelStyle: new TextStyle(color: Colors.white),
            ),
          ),
          Divider(),
          ButtonTheme(
            height: 40.0,
            child: RaisedButton(
              onPressed: () =>{},
              child: Text(
                "Gravar",
                style: TextStyle(color: Colors.lightBlueAccent),
              ),//text
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