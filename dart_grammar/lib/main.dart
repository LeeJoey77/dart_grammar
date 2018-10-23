import 'package:flutter/material.dart';
import 'dartgrammar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { 
    dartGrammar();   
    return MaterialApp(
      title: 'Dart Grammar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dart Grammar'),
        )
      )
    );
  }
}

