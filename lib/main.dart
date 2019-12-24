import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle Alarme',

      
      debugShowCheckedModeBanner: false, // Remove icon debug emulador

      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Controle Alarme'),
    );
  }
}

