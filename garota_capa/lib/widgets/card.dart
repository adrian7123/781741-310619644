import 'package:flutter/material.dart';
import 'package:garota_capa/widgets/texts.dart';

class CardWidget extends StatelessWidget {
  final String id;
  final String nome;
  final String email;
  final Function(DismissDirection) onDimissed;

  CardWidget({this.id, this.nome, this.email, this.onDimissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(id),
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black))),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextH1(this.nome),
                  TextP(this.email),
                ],
              ),
            ),
          ),
        ),
        background: Container(
          padding: EdgeInsets.only(left: 10),
          color: Colors.red,
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        secondaryBackground: Container(
          padding: EdgeInsets.only(right: 10),
          color: Colors.red,
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        onDismissed: this.onDimissed);
  }
}
