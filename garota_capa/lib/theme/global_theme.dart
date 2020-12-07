import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AppTheme { White, Dark, LightGreen, DarkGreen }

/// Returns enum value name without enum class name.
String enumName(AppTheme anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final appThemeData = {
  AppTheme.White:
      ThemeData(brightness: Brightness.light, primaryColor: Colors.blue),
  AppTheme.Dark:
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.black),
  AppTheme.LightGreen:
      ThemeData(brightness: Brightness.light, primaryColor: Colors.lightGreen),
  AppTheme.DarkGreen:
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.green)
};

class GlobalTheme with ChangeNotifier {
  ThemeData themeSelected = appThemeData[AppTheme.White];

  void setTheme() async {
    themeSelected = themeSelected == appThemeData[AppTheme.Dark]
        ? appThemeData[AppTheme.White]
        : appThemeData[AppTheme.Dark];

    notifyListeners();
  }
}
