import 'package:flutter/material.dart';
import 'package:garota_capa/widgets/texts.dart';

class CardWidget extends StatelessWidget {
  final String nome;
  final String email;

  CardWidget({this.nome, this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: [
          TextH1(nome),
          TextP(email),
        ],
      ),
    );
  }
}
