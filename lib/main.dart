import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final CollectionReference testConnection = Firestore.instance.collection(
      'test');

  @override
  Widget build(BuildContext context) {
    testConnection.document().setData({'test': 'test value'});

    return MaterialApp(
        title: 'What to eat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('What to eat'),
            ),
            body: Text('What you have eaten today')
        )
    );
  }
}
