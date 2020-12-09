import 'package:flutter/material.dart';
import 'package:garota_capa/theme/global_theme.dart';
import 'package:garota_capa/widgets/texts.dart';
import 'package:glutton/glutton.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatelessWidget {
  final String nome;
  final String email;

  TodoPage({this.nome, this.email});

  @override
  Widget build(BuildContext context) {
    GlobalTheme _globalTheme = Provider.of<GlobalTheme>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder<Object>(
          future: Glutton.have('isDark'),
          builder: (context, snapshot) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextH1(this.nome),
                TextP(this.email),
                RaisedButton(
                  child: Text('switch theme'),
                  onPressed: () => _globalTheme.setTheme(),
                ),
              ],
            ));
          }),
    );
  }
}
