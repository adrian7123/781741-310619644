import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './splashscreen/splashscreen.dart';
import './home/home_page.dart';
import './authtentication/signin/signin_page.dart';

class _RootPageState extends State<RootPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User _currentUser;

  @override
  void initState() {
    _currentUser = _auth.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenPage(
      afterPage: _currentUser == null ? SignInPage() : HomePage(),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}
