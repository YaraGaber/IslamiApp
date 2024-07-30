import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  // data which if change will effect on my widgets
  String applanguage = "ar";
  ThemeMode appTheme = ThemeMode.light;

  void chengeLanuage(String newlanguage) {
    if (newlanguage == applanguage) {
      return;
    }
    applanguage = newlanguage;
    notifyListeners();
  }

  void chengeTheme(ThemeMode newTheme) {
    if (newTheme == appTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }
}
