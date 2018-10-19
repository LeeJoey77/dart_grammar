import 'package:flutter/material.dart';
import 'dartgrammar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

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

