import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String currentTheme = "light";

  ThemeMode get themeMode {
    if (currentTheme == "light") {
      return ThemeMode.dark;
    } else if (currentTheme == "dark") {
      return ThemeMode.light;
    } else {
      return ThemeMode.light;
    }
  }

  Brightness get themeBirightness {
    if (currentTheme == "light") {
      return Brightness.dark;
    } else if (currentTheme == "dark") {
      return Brightness.light;
    } else {
      return Brightness.light;
    }
  }

  changeTheme(String theme) {
    currentTheme = theme;
    notifyListeners();
  }
}
