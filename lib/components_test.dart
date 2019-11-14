import 'package:flutter/material.dart';

class ComponentsTest extends StatefulWidget {
  ComponentsTest({Key key}) : super(key: key);

  @override
  _ComponentsTestState createState() => _ComponentsTestState();
}






class _ComponentsTestState extends State<ComponentsTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: Text("Teste de componentes"),
      ),

      body: Center(
       child: Column(
         

       ),
      )
    );
  }
}