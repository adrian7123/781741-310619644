import 'package:flutter/material.dart';

enum AppTheme { White, Dark, LightGreen, DarkGreen }

String enumName(AppTheme anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.White:
      ThemeData(brightness: Brightness.light, primaryColor: Colors.blue),
  AppTheme.Dark:
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.black),
  AppTheme.LightGreen:
      ThemeData(brightness: Brightness.light, primaryColor: Colors.lightGreen),
  AppTheme.DarkGreen:
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.green)
};
