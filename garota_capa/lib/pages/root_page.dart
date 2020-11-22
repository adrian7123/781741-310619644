import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garota_capa/auth/auth_controller.dart';

import 'home/home_page.dart';
import 'authtentication/signin/signin_page.dart';

class _RootPageState extends State<RootPage> {
  AuthController _auth = AuthController();

  User _currentUser;

  @override
  void initState() {
    _currentUser = _auth.auth.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _currentUser == null ? SignInPage() : HomePage();
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}
