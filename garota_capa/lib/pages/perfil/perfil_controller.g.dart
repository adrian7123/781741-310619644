// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilController, Store {
  final _$onChangeAtom = Atom(name: '_PerfilController.onChange');

  @override
  bool get onChange {
    _$onChangeAtom.reportRead();
    return super.onChange;
  }

  @override
  set onChange(bool value) {
    _$onChangeAtom.reportWrite(value, super.onChange, () {
      super.onChange = value;
    });
  }

  final _$_PerfilControllerActionController =
      ActionController(name: '_PerfilController');

  @override
  void setOnChange(bool value) {
    final _$actionInfo = _$_PerfilControllerActionController.startAction(
        name: '_PerfilController.setOnChange');
    try {
      return super.setOnChange(value);
    } finally {
      _$_PerfilControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
onChange: ${onChange}
    ''';
  }
}
