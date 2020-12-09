import 'package:flutter/foundation.dart';
import 'package:garota_capa/docs/docs.dart';
import 'package:garota_capa/repositories/todo_interface_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';

class TodoRepository extends ITodoRepository {
  HasuraConnect connect;
  static HttpLink httpLink =
      HttpLink(uri: 'https://todo-app-hasure.hasura.app/v1/graphql');

  TodoRepository() {
    this.connect =
        HasuraConnect('https://todo-app-hasure.hasura.app/v1/graphql');
  }

  // ignore: missing_required_param
  static AuthLink authLink = AuthLink();

  static Link link = httpLink;

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );

  @override
  Future<void> save(String nome, String email) async {
    await connect
        .mutation(addTodo, variables: {'nome': nome, 'email': email})
        .then((value) => print('User Added'))
        .catchError((onError) => print('error $onError'));
  }

  @override
  Future<void> delete(String id) async {
    await connect
        .mutation(removeTodo, variables: {'id': id})
        .then((value) => print('User removed'))
        .catchError((onError) => print('error $onError'));
  }
}

TodoRepository todoRepository = new TodoRepository();
