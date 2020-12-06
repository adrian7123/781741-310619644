import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:garota_capa/auth/auth_auth.dart';
import 'package:garota_capa/models/user_model.dart';
import 'package:garota_capa/pages/todo/todo_page.dart';
import 'package:garota_capa/widgets/add_user.dart';
import 'package:garota_capa/widgets/card.dart';
import 'package:garota_capa/widgets/texts.dart';

import './home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = HomeController();

  final AuthAuth _auth = AuthAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<UserModel>(
            future: _auth.getUserData(),
            builder: (_, snapshot) {
              UserModel _user = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting)
                return Container();
              return TextH1(
                _user.nome,
                color: Colors.white,
              );
            }),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
            ),
            onPressed: () => Navigator.pushNamed(context, 'perfil'),
          ),
        ],
      ),
      body: Container(
        child: Observer(
          builder: (_) => StreamBuilder<QuerySnapshot>(
            stream: controller.users.snapshots(),
            builder: (_, snapshot) {
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
                    .map((DocumentSnapshot doc) => GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => TodoPage(
                                      nome: doc.data()['nome'],
                                      email: doc.data()['email']))),
                          child: CardWidget(
                            item: doc.id,
                            nome: doc.data()['nome'],
                            email: doc.data()['email'],
                            onDimissed: controller.remove,
                          ),
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
