import 'package:flutter/material.dart';
import 'package:garota_capa/models/todo_model.dart';

class AddUserWidget extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final Function(TodoModel) callback;

  AddUserWidget(this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
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
                "Salvar",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                TodoModel todo = new TodoModel(
                  nome: _nomeController.text == ''
                      ? 'User'
                      : _nomeController.text,
                  email: _emailController.text == ''
                      ? 'Email'
                      : _emailController.text,
                );
                callback(todo);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
