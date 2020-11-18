import 'package:flutter/material.dart';

class Cardizinho extends StatelessWidget {
  final String nome;
  final String email;

  Cardizinho({this.nome, this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: [
          Text(nome, style: TextStyle(fontSize: 30)),
          Text(email),
        ],
      ),
    );
  }
}
