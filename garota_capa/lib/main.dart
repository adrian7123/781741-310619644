import 'package:flutter/material.dart';
import 'package:garota_capa/repositories/todo_repository.dart';
import 'package:garota_capa/theme/global_theme.dart';
import 'package:garota_capa/rotas/rotas.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GlobalTheme(),
      child: Consumer<GlobalTheme>(
        builder: (context, theme, _) {
          return GraphQLProvider(
            client: todoRepository.client,
            child: CacheProvider(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Garota Capa',
                // ignore: dead_code
                theme: theme.themeSelected,
                routes: rotas,
              ),
            ),
          );
        },
      ),
    );
  }
}
