import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:garota_capa/pages/authtentication/signup/signup_controller.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController controller = SignUpController();
  final _formKey = GlobalKey<FormState>();

  String validator(String val, String text) {
    if (val.isEmpty) {
      return 'Ensira um $text';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _senhaCon, _confirmSenhaCon;
    String nome;
    String sobrenome;
    String email;
    String senha;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se'),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Nome',
                //   ),
                //   keyboardType: TextInputType.text,
                //   validator: (val) => validator(val, 'Nome'),
                //   obscureText: false,
                //   onEditingComplete: () {},
                // ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Sobrenome',
                //   ),
                //   keyboardType: TextInputType.text,
                //   validator: (val) => validator(val, 'Sobrenome'),
                //   obscureText: false,
                //   onEditingComplete: () {},
                // ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) => validator(val, 'Email'),
                  obscureText: false,
                  onEditingComplete: () {},
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (val) => val.isEmpty ? 'Ensira uma Senha' : null,
                  obscureText: true,
                  onEditingComplete: () {},
                  controller: _senhaCon,
                ),
                // TextFormField(
                //   controller: _confirmSenhaCon,
                //   decoration: InputDecoration(
                //     labelText: 'Confirme a Senha',
                //   ),
                //   keyboardType: TextInputType.text,
                //   validator: (val) {
                //     if (val.isEmpty) {
                //       return "Campo Obrigatorio";
                //     }
                //     if (val != _senhaCon.text) {
                //       return "Senhas Diferentes";
                //     }
                //     return null;
                //   },
                //   obscureText: true,
                //   onEditingComplete: () {
                //     if (_confirmSenhaCon.text != _senhaCon.text) {
                //       return "Senhas Diferentes";
                //     }
                //     return null;
                //   },
                // ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: Observer(
                    builder: (_) => controller.busy
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            onPressed: () => controller.loading(
                              () async {
                                if (_formKey.currentState.validate()) {
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
                                  Scaffold.of(context).showSnackBar(snackBar);
                                }
                              },
                            ),
                            child: Text('Salvar'),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
