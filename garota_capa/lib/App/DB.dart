import 'package:firebase_database/firebase_database.dart';

abstract class IDB {
  String read();
  void write(Map<String, String> value);
  void update(String id, String value);
  void delete(String id);
}

class DB implements IDB {
  final dbRef = FirebaseDatabase.instance.reference();

  @override
  void write(Map<String, String> value) {
    dbRef.push().set(value);
  }


  @override
  String read() {
    
    return '';
  }

  @override
  void delete(String id) {
      
  }

  @override
  void update(String id, String value) {
    
  }

}