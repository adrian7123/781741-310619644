import 'package:flutter/material.dart';
import 'package:garota_capa/widgets/texts.dart';
import 'package:glutton/glutton.dart';

class TodoPage extends StatelessWidget {
  final String nome;
  final String email;

  TodoPage({this.nome, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Object>(
          future: Glutton.have('isDark'),
          builder: (context, snapshot) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextH1(this.nome),
                TextP(this.email),
                Text(snapshot.data.toString())
              ],
            ));
          }),
    );
  }
}
