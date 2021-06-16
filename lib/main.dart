import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home ()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infotext = "Pode entrar!";

  void _changePeople(int delta){
    setState(() {
      _people += delta;
      if(_people < 0){
        _infotext = "Morreu um velho!?";
      } else if (_people <= 16068) {
        _infotext = "Pode entrar!";
      } else {
        _infotext = "Lotado!";
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Image.asset(
            "images/vilabelmiro.png",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: TextStyle(fontSize: 45.0, color: Colors.yellow, fontWeight: FontWeight.normal, decoration: TextDecoration.none),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.yellow),
                    ),
                    onPressed: () {_changePeople(1);},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.yellow),
                    ),
                    onPressed: () {_changePeople(-1);},
                  ),
                ),
              ],
            ),
            Text("$_infotext",
                style: TextStyle(
                    color: Colors.yellow,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0)),
          ])
        ]);
  }
}

