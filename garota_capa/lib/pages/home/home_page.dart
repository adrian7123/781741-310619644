import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:garota_capa/auth/auth_controller.dart';
import 'package:garota_capa/widgets/add_user.dart';
import 'package:garota_capa/widgets/card.dart';
import 'package:garota_capa/widgets/texts.dart';

import './home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = HomeController();

  final user = new AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextH1(
          user.getEmail == null ? 'User not found' : user.getEmail,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Observer(
          builder: (_) => StreamBuilder<QuerySnapshot>(
            stream: controller.users.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: TextP("error"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data.docs
                    .map((DocumentSnapshot doc) => CardWidget(
                          item: doc.id,
                          nome: doc.data()['nome'],
                          email: doc.data()['email'],
                          onDimissed: controller.remove,
                        ))
                    .toList(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddUserWidget(controller.increment),
                  )));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
