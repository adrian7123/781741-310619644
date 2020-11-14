import 'package:flutter/material.dart';
import 'package:garota_capa/App/DB.dart';
class HomePage extends StatelessWidget {
  final db = DB();

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Adicionar ao Banco'
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: 
              RaisedButton(
                child: Text('Cadastrar'),
                onPressed: () => db.write({
                  'name': 'Adrian',
                  'sla': _textController.text
                }),
              ))
            ],
          )
            
              
              
        
        ],
      )
      )
    );
  }
}