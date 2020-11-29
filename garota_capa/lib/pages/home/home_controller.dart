import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garota_capa/auth/auth_controller.dart';
import 'package:garota_capa/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  AuthController auth;

  @observable
  CollectionReference users = FirebaseFirestore.instance.collection('todo');

  @action
  Future<void> increment(UserModel user) {
    return users
        .add({'nome': user.nome, 'email': user.email, 'token': user.token})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  remove(String doc) {
    users.doc(doc).delete();
    print('User Deleted');
  }
}
