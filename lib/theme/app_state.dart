// import 'package:flutter/material.dart';
//
// class AppState extends ChangeNotifier {
//   bool _isDark = false;
//
//   bool get isDark => _isDark;
//
//   void toggleTheme() {
//     _isDark = !_isDark;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // 👈 IMPORTANT

  ThemeMode get themeMode => _themeMode;

  bool get isDark =>
      _themeMode == ThemeMode.dark ||
          (_themeMode == ThemeMode.system &&
              WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                  Brightness.dark);

  void toggleTheme() {
    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  void useSystemTheme() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }
}
