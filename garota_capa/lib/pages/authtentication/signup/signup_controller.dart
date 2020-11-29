import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:garota_capa/utils/text_to_md5.dart';
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignUpController = _SignUpController with _$SignUpController;

abstract class _SignUpController with Store {
  @observable
  bool busy = false;

  @action
  void loading() {
    busy = true;
  }

  @action
  Future<String> signup(
      {String nome, String sobrenome, String email, String senha}) async {
    senha = textToMd5(senha.trim());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email.trim(), password: senha);
    } on FirebaseAuthException catch (e) {
      busy = false;
      if (e.code == 'email-already-in-use') {
        return 'Email já Cadastrado';
      } else if (e.code == 'invalid-email') {
        return 'Email invalido';
      } else {
        return e.code;
      }
    }

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users
        .doc(email.trim())
        .set({
          'nome': nome.trim(),
          'sobrenome': sobrenome.trim(),
          'email': email.trim(),
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

    return '';
  }
}
