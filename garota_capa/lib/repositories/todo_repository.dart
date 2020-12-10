import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garota_capa/models/todo_model.dart';
import 'package:garota_capa/repositories/rules/todo_interface_repository.dart';

class TodoRepository extends ITodoRepository {
  CollectionReference todo = FirebaseFirestore.instance.collection('todo');

  Stream<List<TodoModel>> getTodos() {
    return todo.snapshots().map(
          (snap) => snap.docs
              .map(
                (data) => TodoModel(
                  id: data.id.toString(),
                  nome: data.data()['nome'].toString(),
                  email: data.data()['email'].toString(),
                ),
              )
              .toList(),
        );
  }

  @override
  void add(TodoModel todoModel) {
    var _currentDate = new DateTime.now();
    todo
        .add({
          'nome': todoModel.nome,
          'email': todoModel.email,
          'created_at': _currentDate,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  void delete(String id) {
    todo.doc(id).delete();
    print('User Deleted');
  }
}

TodoRepository todoRepository = TodoRepository();
