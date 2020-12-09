import 'package:flutter/material.dart';
import 'package:garota_capa/pages/authtentication/signin/signin_page.dart';
import 'package:garota_capa/pages/authtentication/signup/signup_page.dart';
import 'package:garota_capa/pages/perfil/perfil_page.dart';
import 'package:garota_capa/pages/home/home_page.dart';
// import 'package:garota_capa/pages/root_page.dart';

Map<String, Widget Function(BuildContext)> rotas = {
  '/': (_) => HomePage(), //RootPage(),
  'home': (_) => HomePage(),
  'signIn': (_) => SignInPage(),
  'signUp': (_) => SignUpPage(),
  'perfil': (_) => PerfilPage(),
};
