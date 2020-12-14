import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glutton/glutton.dart';

import './app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // impede que o app mude a sua orientação
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  bool _isDark;

  //  checa se o app esta em dark theme
  if (await Glutton.have('isDark')) {
    _isDark = await Glutton.vomit('isDark');
  }

  runApp(MyApp(_isDark));
}
