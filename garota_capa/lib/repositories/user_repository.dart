import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:garota_capa/models/user_model.dart';
import 'package:garota_capa/repositories/rules/user_interface_repository.dart';

class UserRepository extends IUserRepository {
  FirebaseAuth _auth;
  CollectionReference _user;

  String get email => _auth.currentUser.email;

  UserRepository() {
    this._auth = FirebaseAuth.instance;
    this._user = FirebaseFirestore.instance.collection('users');
  }

  @override
  Stream<UserModel> getUserData() {
    return _user.doc(email).snapshots().map((snap) {
      return UserModel(
        nome: snap.data()['nome'],
        email: snap.data()['email'],
      );
    });
  }

  @override
  void updatePass(String newPass) {
    _auth.currentUser.updatePassword(newPass);
  }

  @override
  void signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }
}

UserRepository userRepository = UserRepository();
