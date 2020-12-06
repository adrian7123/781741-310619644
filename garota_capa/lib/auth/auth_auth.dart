import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garota_capa/models/user_model.dart';

class AuthAuth {
  FirebaseAuth _auth;

  CollectionReference _user;

  String nome;

  AuthAuth() {
    this._auth = FirebaseAuth.instance;
    this._user = FirebaseFirestore.instance.collection('users');
  }

  Future<UserModel> getUserData() async {
    UserModel _userModel;

    await _user.doc(email).get().then((snap) {
      _userModel = UserModel(
        nome: snap.data()['nome'],
        email: snap.data()['email'],
        sobrenome: 'zgvdhj',
      );
    });

    return _userModel;
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
