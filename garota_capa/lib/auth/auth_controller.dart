import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  FirebaseAuth get auth => FirebaseAuth.instance;

  String get getEmail => auth.currentUser.email;

  void signOut() async {
    await auth.signOut();
  }
}
