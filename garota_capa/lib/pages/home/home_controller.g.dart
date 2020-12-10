// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$_initAsyncAction = AsyncAction('_HomeController._init');

  @override
  Future<void> _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  void increment(TodoModel user) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.increment');
    try {
      return super.increment(user);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(String id) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.remove');
    try {
      return super.remove(id);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
