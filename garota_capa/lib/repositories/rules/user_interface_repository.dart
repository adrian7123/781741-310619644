import 'package:flutter/material.dart';
import 'package:garota_capa/models/user_model.dart';

abstract class IUserRepository {
  Stream<UserModel> getUserData();
  void signOut(BuildContext context);
  void updatePass(String newPass);
}
