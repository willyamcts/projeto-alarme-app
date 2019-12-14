import 'package:flutter/material.dart';
import 'package:alarme_app/components_test.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // false = inactve != true
  bool _activeAlarm =
      false; // TODO: Verifica se está conectado e atribui a variável

  String _mainTextButton;

  bool testMode = false;

  String _attribContentMainButton() {
    _mainTextButton = 'ATIVAR';

    if (_activeAlarm == true) {
      _mainTextButton = 'DESATIVAR';

      print("alarme ativado...");
    } else {
      print("\nalarme desativado");
    }
  }

  // Altera o estado botão principal, alarme ativado / desativado;
  void _checkOn() {
    _activeAlarm = !_activeAlarm;

    _attribContentMainButton();

    setState(() {});
  }

  // TODO: Incluir alerta notificando usuário do modo teste
  void _testModeAlert() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ComponentsTest()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            new FlatButton(
              child: Text(
                '$_mainTextButton',
                textScaleFactor: 1.85,
              ),
              onPressed: _checkOn,
              color: _activeAlarm ? Colors.green : Colors.red,
              shape: new CircleBorder(),
              padding: const EdgeInsets.all(105.0),
            ),
            
            Center(
                child: Container(
                    margin: EdgeInsets.fromLTRB(0, 35, 0, 5),
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
