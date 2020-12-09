import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:garota_capa/pages/image/user_Image.dart';
import 'package:garota_capa/pages/perfil/perfil_controller.dart';
import 'package:garota_capa/widgets/texts.dart';

class _PerfilPageState extends State<PerfilPage> {
  PerfilController controller = PerfilController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextH1('Perfil'),
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        UserImage(imagePath: 'assets/menina-tumblr.jpg'),
                  )),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Container(
                  height: 280,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/menina-tumblr.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Observer(
            builder: (_) =>
                Icon(controller.onChange ? Icons.done : Icons.edit)),
        onPressed: () {
          controller.setOnChange(!controller.onChange);
        },
      ),
    );
  }
}

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}
