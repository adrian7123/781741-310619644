import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GlobalTheme with ChangeNotifier {
  ThemeData themeSelected = ThemeData.light();

  void changeTheme() {
    this.themeSelected = this.themeSelected == ThemeData.light()
        ? ThemeData.dark()
        : ThemeData.light();
    notifyListeners();
  }
}
