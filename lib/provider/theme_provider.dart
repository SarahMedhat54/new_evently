import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

  void updateTheme(ThemeMode newMode){
    themeMode = newMode;
    notifyListeners();

import 'package:flutter/material.dart';

class ThemeProvider  extends  ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

  void updateTheme (ThemeMode mode)
  {
    themeMode = mode ;
    notifyListeners();

  }
}