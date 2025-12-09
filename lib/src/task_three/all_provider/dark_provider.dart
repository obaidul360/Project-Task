import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme(bool isOn) {
    isDarkMode = isOn;
    notifyListeners();
  }
}