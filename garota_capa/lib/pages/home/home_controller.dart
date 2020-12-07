import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garota_capa/models/user_model.dart';
import 'package:garota_capa/repositories/todo_repository.dart';
import 'package:garota_capa/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  UserRepository user = UserRepository();

  @observable
  CollectionReference todos = TodoRepository.todo;

  @action
  Future<void> increment(UserModel user) {
    var _currentDate = new DateTime.now();
    return todos
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
    todos.doc(doc).delete();
    print('User Deleted');
  }
}
