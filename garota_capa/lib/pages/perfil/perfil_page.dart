import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:garota_capa/pages/image/user_Image.dart';
import 'package:garota_capa/pages/perfil/perfil_controller.dart';
import 'package:garota_capa/widgets/texts.dart';
import 'package:provider/provider.dart';

import 'package:garota_capa/models/user_model.dart';

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    PerfilController controller = Provider.of<PerfilController>(context);
    return Scaffold(
      appBar: AppBar(
        title: TextH1('Perfil'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              controller.signOut(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => UserImage(
                    imagePath: 'assets/menina-tumblr.jpg',
                  ),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage(
                    'assets/menina-tumblr.jpg',
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream: controller.user,
              builder: (_, snap) {
                if (snap.hasError) {
                  return Center(
                    child: TextP("error"),
                  );
                }

                if (snap.connectionState == ConnectionState.waiting) {
                  return Container();
                }

                UserModel _user = snap.data;

                return Text('$_user');
              },
            )
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
