import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glutton/glutton.dart';

enum AppTheme { White, Dark, LightGreen, DarkGreen }

/// Returns enum value name without enum class name.
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

class GlobalTheme with ChangeNotifier {
  ThemeData themeSelected;

  GlobalTheme() {
    _init();
  }

  Future<void> _init() async {
    if (await Glutton.have('isDark') != true) {
      Glutton.eat('isDark', false);
    }

    print(await Glutton.vomit('isDark'));

    themeSelected = await Glutton.vomit('isDark')
        ? appThemeData[AppTheme.Dark]
        : appThemeData[AppTheme.White];

    notifyListeners();
  }

  void setTheme() async {
    if (await Glutton.vomit('isDark')) {
      themeSelected = appThemeData[AppTheme.White];
      Glutton.eat('isDark', false);

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else {
      themeSelected = appThemeData[AppTheme.Dark];
      Glutton.eat('isDark', true);

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    }

    notifyListeners();
  }
}
