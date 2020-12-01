import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  FirebaseAuth _auth;

  AuthController() {
    this._auth = FirebaseAuth.instance;
  }

  String get email => _auth.currentUser.email;

  void signOut() async {
    await _auth.signOut();
  }
}
