// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpController on _SignUpController, Store {
  final _$busyAtom = Atom(name: '_SignUpController.busy');

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

  final _$signupAsyncAction = AsyncAction('_SignUpController.signup');

  @override
  Future<String> signup(
      {String nome, String sobrenome, String email, String senha}) {
    return _$signupAsyncAction.run(() => super
        .signup(nome: nome, sobrenome: sobrenome, email: email, senha: senha));
  }

  final _$_SignUpControllerActionController =
      ActionController(name: '_SignUpController');

  @override
  void loading() {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.loading');
    try {
      return super.loading();
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
busy: ${busy}
    ''';
  }
}
