import 'package:garota_capa/models/todo_model.dart';
import 'package:garota_capa/repositories/todo_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  void save(TodoModel user) => todoRepository.save(user.nome, user.email);

  void delete(String id) => todoRepository.delete(id);
}
