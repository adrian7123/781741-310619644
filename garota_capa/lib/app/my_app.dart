import 'package:flutter/material.dart';
import 'package:garota_capa/pages/home/home_controller.dart';
import 'package:garota_capa/pages/perfil/perfil_controller.dart';
import 'package:garota_capa/theme/global_theme.dart';
import 'package:provider/provider.dart';

import './rotas/rotas.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeController>(
          create: (_) => HomeController(),
        ),
        Provider<PerfilController>(
          create: (_) => PerfilController(),
        )
      ],
      child: ChangeNotifierProvider(
        create: (_) => GlobalTheme(),
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
      ),
    );
  }
}
