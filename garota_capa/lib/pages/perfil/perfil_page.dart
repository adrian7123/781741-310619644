import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:garota_capa/auth/auth_auth.dart';
import 'package:garota_capa/models/user_model.dart';
import 'package:garota_capa/pages/perfil/perfil_controller.dart';
import 'package:garota_capa/pages/theme/global_theme.dart';
import 'package:garota_capa/widgets/texts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class _PerfilPageState extends State<PerfilPage> {
  AuthAuth _auth = AuthAuth();

  PerfilController controller = PerfilController();

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalTheme globalTheme = Provider.of<GlobalTheme>(context);

    return Scaffold(
      appBar: AppBar(
        title: TextH1('Perfil'),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _auth.signOut(context);
              })
        ],
      ),
      body: FutureBuilder<UserModel>(
        future: _auth.getUserData(),
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

          _nomeController.text = _user.nome;
          _emailController.text = _user.email;

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
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
                Container(
                  child: Observer(
                    builder: (_) => controller.onChange
                        ? Center(
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    controller: _nomeController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder()),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(fontSize: 19),
                                  ),
                                ),
                                Container(height: 10),
                                Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder()),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(fontSize: 19),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            child: Center(
                              child: Column(
                                children: [
                                  Divider(height: 20),
                                  TextH2('${_user.nome} Bueno'),
                                  Divider(height: 20),
                                  TextH2(_user.email),
                                  Divider(height: 20),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                      child: Text('Switch theme'),
                      onPressed: () {
                        globalTheme.changeTheme();
                      }),
                )
              ],
            ),
          );
        },
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
