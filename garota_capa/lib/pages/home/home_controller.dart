import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garota_capa/models/todo_model.dart';
import 'package:garota_capa/models/user_model.dart';
import 'package:garota_capa/repositories/todo_repository.dart';
import 'package:garota_capa/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  CollectionReference todo;
  Stream<List<TodoModel>> todos;

  Stream<UserModel> user;

  _HomeController() {
    _init();
  }

  @action
  Future<void> _init() async {
    todo = todoRepository.todo;
    user = userRepository.getUserData();
    todos = todoRepository.getTodos();
  }

  @action
  void increment(TodoModel user) {
    todoRepository.add(user);
  }

  @action
  void remove(String id) {
    todoRepository.delete(id);
  }
}
