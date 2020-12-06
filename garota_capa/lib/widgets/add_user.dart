import 'package:flutter/material.dart';
import 'package:garota_capa/models/user_model.dart';

class AddUserWidget extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final Function(UserModel) callback;

  AddUserWidget(this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
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
            Container(
              width: double.infinity,
              child: FlatButton(
                color: Colors.blue,
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  UserModel user = new UserModel(
                      nome: _nomeController.text == ''
                          ? 'user'
                          : _nomeController.text,
                      email: _emailController.text == ''
                          ? 'email'
                          : _emailController.text,
                      sobrenome: 'vgzhsd');
                  callback(user);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
