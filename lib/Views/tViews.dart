
import 'package:flutter/material.dart';

class TelaR extends StatefulWidget {
  @override
  _TelaRState createState() => _TelaRState();
}

class _TelaRState extends State<TelaR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                FlatButton(
                   color: Colors.blue,
                   onPressed: (){},
                   child: Text("Botão 1"),
               ),
               FlatButton(
                 color: Colors.green,
                 onPressed: (){},
                 child: Text("bot2"),
               ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                FlatButton(
                   color: Colors.blue,
                   onPressed: (){},
                   child: Text("Botão 1"),
               ),
               FlatButton(
                 color: Colors.green,
                 onPressed: (){},
                 child: Text("bot2"),
               ),
              ]
            ),
          ],
        ),
        







        
      ),
      
      
    );
  }
}