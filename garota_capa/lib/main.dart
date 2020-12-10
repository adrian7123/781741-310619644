import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:garota_capa/models/user_model.dart';
import 'package:garota_capa/pages/home/home_controller.dart';
import 'package:garota_capa/theme/global_theme.dart';
import 'package:garota_capa/rotas/rotas.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GlobalTheme>(create: (_) => GlobalTheme()),
        Provider<UserModel>(create: (_) => UserModel()),
        Provider<HomeController>(create: (_) => HomeController()),
      ],
      child: Consumer<GlobalTheme>(
        builder: (context, theme, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Garota Capa',
            // ignore: dead_code
            theme: theme.themeSelected,
            routes: rotas,
          );
        },
      ),
    );
  }
}
