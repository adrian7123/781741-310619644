import 'package:garota_capa/models/todo_model.dart';

abstract class ITodoRepository {
  Stream<List<TodoModel>> getTodos();
  void delete(String id);
  void add(TodoModel todoModel);
}
