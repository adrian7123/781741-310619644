import 'package:flutter/material.dart';
import 'package:garota_capa/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

import 'package:garota_capa/models/user_model.dart';

part 'perfil_controller.g.dart';

class PerfilController = _PerfilController with _$PerfilController;

abstract class _PerfilController with Store {
  _PerfilController() {
    _init();
  }

  Stream<UserModel> user;

  @action
  void _init() {
    user = userRepository.getUserData();
  }

  @observable
  bool onChange = false;

  @action
  void setOnChange(bool value) => this.onChange = value;

  @action
  void signOut(BuildContext context) {
    userRepository.signOut(context);
  }
}
