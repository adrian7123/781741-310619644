import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:garota_capa/models/user_model.dart';

class UserRepository {
  FirebaseAuth _auth;
  CollectionReference _user;

  UserRepository() {
    this._auth = FirebaseAuth.instance;
    this._user = FirebaseFirestore.instance.collection('users');
  }

  Stream<UserModel> getUserData() {
    return _user.doc(email).snapshots().map((snap) {
      return UserModel(
        nome: snap.data()['nome'],
        email: snap.data()['email'],
      );
    });
  }

  String get email => _auth.currentUser.email;

  set password(String newPass) {
    _auth.currentUser.updatePassword(newPass);
  }

  void signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }
}

UserRepository userRepository = UserRepository();
