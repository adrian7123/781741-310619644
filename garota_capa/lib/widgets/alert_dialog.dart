import 'package:flutter/material.dart';
import 'package:garota_capa/models/user_model.dart';

void showAlertDialog(BuildContext context, Function(UserModel) button) {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  Widget content = Container(
    width: double.infinity,
    height: 100,
    child: Column(
      children: [
        TextField(
          controller: _nomeController,
          decoration: InputDecoration(labelText: 'Nome'),
        ),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
      ],
    ),
  );

  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed: () {
      UserModel user = new UserModel(
          nome: _nomeController.text,
          email: _emailController.text,
          token: 'vgzhsd');

      button(user);
      Navigator.of(context).pop();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Notice"),
    content: content,
    actions: [continueButton],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
