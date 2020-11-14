import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(child: Text('click'), onPressed: () {
          dbRef.child('number 1').set({
            'id': 'number',
            'data': 'I am Data'
          });
     })
        
      )
    );
  }
}