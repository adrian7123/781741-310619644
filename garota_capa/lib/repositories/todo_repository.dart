import 'package:cloud_firestore/cloud_firestore.dart';

class TodoRepository {
  static CollectionReference todo =
      FirebaseFirestore.instance.collection('todo');
}
