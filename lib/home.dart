import 'package:flutter/material.dart';
import 'package:alarme_app/components_test.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  // false = inactve != true
  bool _activeAlarm =
      false; // TODO: Verifica se está conectado e atribui a variável

  String _mainTextButton;

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

  // Navegação para próx. página
  void _pageComponentsTest() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ComponentsTest()));
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
                    //width: 250,
                    //height: 50,
                    margin: EdgeInsets.fromLTRB(0, 35, 0, 5),
                    child: MaterialButton(
                        color: Colors.blueAccent,
                        onPressed: _pageComponentsTest,
                        shape: new ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Testar Componentes",
                          maxLines: 1,
                          style: TextStyle(fontSize: 20),
                        )),

                        

                    /* new FlatButton(
                      child: Text(
                        "Testar componentes",
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                      ),

                      onPressed: _pageComponentsTest,
                      color: Colors.blueAccent,
                    ) */
                    ))
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}