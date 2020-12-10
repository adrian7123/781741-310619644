import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garota_capa/theme/themes.dart';
import 'package:glutton/glutton.dart';

class GlobalTheme with ChangeNotifier {
  ThemeData themeSelected;

  GlobalTheme() {
    _init();
  }

  Future<void> _init() async {
    if (await Glutton.have('isDark') != true) {
      Glutton.eat('isDark', false);
    }

    themeSelected = await Glutton.vomit('isDark')
        ? appThemeData[AppTheme.Dark]
        : appThemeData[AppTheme.White];

    if (await Glutton.vomit('isDark')) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    }

    notifyListeners();
  }

  void setTheme() async {
    if (await Glutton.vomit('isDark')) {
      themeSelected = appThemeData[AppTheme.White];
      Glutton.eat('isDark', false);

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      themeSelected = appThemeData[AppTheme.Dark];
      Glutton.eat('isDark', true);

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }

    notifyListeners();
  }
}
