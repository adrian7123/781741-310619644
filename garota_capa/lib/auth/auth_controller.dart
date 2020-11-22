import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  String get getEmail => _auth.currentUser.email;

  void signOut() async {
    await _auth.signOut();
  }
}
