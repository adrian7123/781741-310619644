import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:garota_capa/auth/auth_controller.dart';
import 'package:garota_capa/widgets/cardizinho.dart';

import './home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = HomeController();

  final user = new AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.getEmail == null ? 'User not found' : user.getEmail),
      ),
      body: Container(
        child: Observer(
          builder: (_) => StreamBuilder<QuerySnapshot>(
            stream: controller.users.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text("error", style: TextStyle(fontSize: 30)));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return new ListView(
                children: snapshot.data.docs
                    .map((DocumentSnapshot document) => Cardizinho(
                          nome: document.data()['nome'],
                          email: document.data()['email'],
                        ))
                    .toList(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          user.signOut();
          Navigator.pushReplacementNamed(context, '/');
        },
        // onPressed: () async {
        //   showAlertDialog(context, controller.increment);
        // },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
