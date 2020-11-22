// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$usersAtom = Atom(name: '_HomeController.users');

  @override
  CollectionReference get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(CollectionReference value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  Future<void> increment(UserModel user) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.increment');
    try {
      return super.increment(user);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users}
    ''';
  }
}
