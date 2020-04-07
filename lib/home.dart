//import 'package:control_alarme/classes.dart';
//import 'package:controle_alarme/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:controle_alarme_app/simulation/main_test.dart';
import 'package:controle_alarme_app/services/management.dart';


import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // false = inactve != true
  bool _activeAlarm =
  false; // TODO: Verifica se está conectado e atribui a variável

  String _mainTextButton;

  bool testMode = false;



  // Change text in main button
  //    using: _checkOn
  String _attribContentMainButton(bool state) {
    _mainTextButton = 'ATIVAR';

    if (_activeAlarm) {
      _mainTextButton = 'DESATIVAR';

      print("alarme ativado...");
    } else {
      print("\nalarme desativado");
    }
  }



  // Altera o estado botão principal, alarme ativado / desativado;
  void _checkOn() {

    dbRef.child(docState).update({
      'on' : !_activeAlarm ? 1 : 0, // true = 1 | false = 0
    }).then((_) {

      setState(() {
        _activeAlarm = !_activeAlarm;
        _attribContentMainButton(_activeAlarm);
      });

      print('State alterado para: ${_activeAlarm ? 1 : 0}');
    });
  }



  // TODO: Incluir alerta notificando usuário do modo teste
  void _testModeAlert() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ComponentsTest()));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
            ),
            onPressed: () {},

            /* icon: Icon(userSnapshot.hasData
             ? Icons.exit_to_app
             : Icons.account_circle),
             */
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

/*
            // Two guides, Control and History
            new DefaultTabController(
                length: 2,
                child: TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.home)),
                        Tab(icon: Icon(Icons.history)),
                      ],
                )),

*/
            // TODO: incluso em classes.dart
            new FlatButton(
              child: Text(
                '$_mainTextButton',
                textScaleFactor: 1.85,
              ),
              onPressed: _checkOn,
              //onPressed: currentState,
              //color: postDbState("/state/laT1udjSw8VORuaYuW15/", !_activeAlarm) ? Colors.green : Colors.red,
              color: _activeAlarm ? Colors.green : Colors.red,
              shape: new CircleBorder(side: BorderSide(color: Colors.black45, width: 2.0)),
              padding: const EdgeInsets.all(105.0),
            ),




            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Tempo ligado",
                        style:
                        TextStyle(color: Colors.white70, fontSize: 15.0)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Tempo acionado",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 19.0)),
                  ],
                ),
              ],
            ),



            Container(
                child: Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Switch(
                        value: testMode,
                        onChanged: (value) {
                          setState(() {
                            testMode = value;
                          });

                          value ? _testModeAlert() : {};
                        })))
          ],
        ),
      ),
    );
  }
}
