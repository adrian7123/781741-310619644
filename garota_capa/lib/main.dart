import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:garota_capa/rotas/rotas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Garota Capa',
      theme: ThemeData.light(),
      routes: rotas,
    );
  }
}
