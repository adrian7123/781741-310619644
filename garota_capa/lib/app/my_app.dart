import 'package:flutter/material.dart';
import 'package:garota_capa/app/providers.dart';
import 'package:garota_capa/theme/global_theme.dart';
import 'package:provider/provider.dart';

import './rotas/rotas.dart';

class MyApp extends StatelessWidget {
  final bool _isDark;

  const MyApp(this._isDark, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ChangeNotifierProvider(
        create: (_) => GlobalTheme(),
        child: Consumer<GlobalTheme>(
          builder: (context, theme, widget) {
            return theme.themeSelected == null
                ? MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Garota Capa',
                    theme:
                        _isDark == null ? ThemeData.light() : ThemeData.dark(),
                    routes: rotas,
                  )
                : MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Garota Capa',
                    theme: theme.themeSelected,
                    routes: rotas,
                  );
          },
        ),
      ),
    );
  }
}
