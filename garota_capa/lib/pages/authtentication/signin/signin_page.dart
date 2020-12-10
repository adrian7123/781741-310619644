import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:garota_capa/widgets/texts.dart';
import './signin_controller.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final SignInController controller = SignInController();

  @override
  Widget build(BuildContext context) {
    String email;
    String senha;

    return Scaffold(
        appBar: AppBar(
          title: TextH1(
            'Login',
            color: Colors.white,
          ),
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Ensira um Email';
                        }
                        email = val;
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Ensira a Senha';
                        }
                        senha = val;
                        return null;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: Observer(
                        builder: (context) => controller.busy
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    controller.loading();
                                    var result =
                                        await controller.signin(email, senha);
                                    if (result == '') {
                                      Navigator.pushReplacementNamed(
                                          context, '/');
                                    }

                                    final snackBar = SnackBar(
                                      content: Text('$result'),
                                    );
                                    Scaffold.of(context).showSnackBar(snackBar);
                                  }
                                },
                                child: Text('login'),
                              ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: InkWell(
                        child: Text(
                          'Cadastre-se',
                          style: TextStyle(color: Colors.blue, fontSize: 30),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'signUp');
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
