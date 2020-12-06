import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garota_capa/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  CollectionReference users = FirebaseFirestore.instance.collection('todo');

  @action
  Future<void> increment(UserModel user) {
    var _currentDate = new DateTime.now();
    return users
        .add({
          'nome': user.nome,
          'email': user.email,
          'sobrenome': user.sobrenome,
          'created_at': _currentDate,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void remove(String doc) {
    users.doc(doc).delete();
    print('User Deleted');
  }
}
