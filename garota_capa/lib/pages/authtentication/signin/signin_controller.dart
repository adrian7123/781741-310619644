import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'signin_controller.g.dart';

class SignInController = _SignInController with _$SignInController;

abstract class _SignInController with Store {
  @observable
  bool busy = false;

  @action
  void loading(Function() callback) {
    busy = true;
    callback();
  }

  @action
  Future<String> signin(String email, String senha) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: senha.trim());
    } on FirebaseAuthException catch (e) {
      busy = false;
      if (e.code == 'user-not-found') {
        print('Usuario Inexistente');
        return 'Usuario Inexistente';
      } else if (e.code == 'wrong-password') {
        print('Senha Invalida');
        return 'Senha Invalida';
      } else if (e.code == 'invalid-email') {
        return 'Email Invalido';
      } else {
        return e.code;
      }
    }
    return '';
  }
}
