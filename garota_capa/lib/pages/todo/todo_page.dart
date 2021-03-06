import 'package:flutter/material.dart';
import 'package:garota_capa/theme/global_theme.dart';
import 'package:garota_capa/widgets/texts.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatelessWidget {
  final String nome;
  final String email;

  TodoPage({this.nome, this.email});

  @override
  Widget build(BuildContext context) {
    GlobalTheme _globalTheme = Provider.of<GlobalTheme>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextH1(
              this.nome,
              fontSize: 70,
            ),
            TextP(this.email),
            RaisedButton(
              child: Text('switch theme'),
              onPressed: () => _globalTheme.setTheme(),
            ),
          ],
        ),
      ),
    );
  }
}
