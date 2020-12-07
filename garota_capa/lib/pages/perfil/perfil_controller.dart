import 'package:mobx/mobx.dart';

part 'perfil_controller.g.dart';

class PerfilController = _PerfilController with _$PerfilController;

abstract class _PerfilController with Store {
  // Editing Data
  @observable
  bool onChange = false;

  @action
  void setOnChange(bool value) => this.onChange = value;
}
