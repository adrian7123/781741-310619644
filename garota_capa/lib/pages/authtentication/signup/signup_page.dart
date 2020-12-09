import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:garota_capa/pages/authtentication/signup/signup_controller.dart';
import 'package:garota_capa/widgets/texts.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController controller = SignUpController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _senhaCon = TextEditingController();
    TextEditingController _confirmSenhaCon = TextEditingController();
    String nome;
    String sobrenome;
    String email;
    String senha;

    return Scaffold(
        appBar: AppBar(
          title: TextH1(
            'Cadastre-se',
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
                        labelText: 'Nome',
                      ),
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Insira seu Nome';
                        }
                        nome = val;
                        return null;
                      },
                      obscureText: false,
                      onEditingComplete: () {},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Sobrenome',
                      ),
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Insira seu Sobrenome';
                        }
                        sobrenome = val;
                        return null;
                      },
                      obscureText: false,
                      onEditingComplete: () {},
                    ),
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
                      obscureText: false,
                      onEditingComplete: () {},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                      ),
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Ensira uma Senha';
                        } else if (val.length < 6) {
                          return 'A senha deve ter no minimo 6 caracteres';
                        }
                        senha = val;
                        return null;
                      },
                      obscureText: true,
                      onEditingComplete: () {},
                      controller: _senhaCon,
                    ),
                    TextFormField(
                        controller: _confirmSenhaCon,
                        decoration: InputDecoration(
                          labelText: 'Confirme a Senha',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (val) {
                          print(val);
                          if (val.isEmpty) {
                            return "Campo Obrigatorio";
                          } else if (val != _senhaCon.text) {
                            return "Senhas Diferentes";
                          }

                          return null;
                        },
                        obscureText: true),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: Observer(
                        builder: (_) => controller.busy
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    controller.loading();
                                    var result = await controller.signup(
                                        nome: nome,
                                        sobrenome: sobrenome,
                                        email: email,
                                        senha: senha);

                                    if (result == '') {
                                      Navigator.pushReplacementNamed(
                                          context, '/');
                                    }

                                    final snackBar = SnackBar(
                                      content: Text('$result'),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                child: Text('Salvar'),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
