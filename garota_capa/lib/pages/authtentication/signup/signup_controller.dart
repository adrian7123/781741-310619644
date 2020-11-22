import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignUpController = _SignUpController with _$SignUpController;

abstract class _SignUpController with Store {
  @observable
  bool busy = false;

  @action
  void loading(Function() callback) {
    busy = true;
    callback();
  }

  Future<String> signup(
      {String nome, String sobrenome, String email, String senha}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: senha.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return e.code;
      } else if (e.code == 'email-already-in-use') {
        return e.code;
      } else {
        return e.code;
      }
    } catch (e) {
      print(e);
    }

    return '';
  }
}
