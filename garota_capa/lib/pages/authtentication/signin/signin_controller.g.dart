// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInController on _SignInController, Store {
  final _$busyAtom = Atom(name: '_SignInController.busy');

  @override
  bool get busy {
    _$busyAtom.reportRead();
    return super.busy;
  }

  @override
  set busy(bool value) {
    _$busyAtom.reportWrite(value, super.busy, () {
      super.busy = value;
    });
  }

  final _$signinAsyncAction = AsyncAction('_SignInController.signin');

  @override
  Future<String> signin(String email, String senha) {
    return _$signinAsyncAction.run(() => super.signin(email, senha));
  }

  final _$_SignInControllerActionController =
      ActionController(name: '_SignInController');

  @override
  void loading() {
    final _$actionInfo = _$_SignInControllerActionController.startAction(
        name: '_SignInController.loading');
    try {
      return super.loading();
    } finally {
      _$_SignInControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
busy: ${busy}
    ''';
  }
}
