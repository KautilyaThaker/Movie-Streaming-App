import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;

  bool get isDark => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }

}

class MyThemes{
  static final darkTheme = ThemeData(
    fontFamily: 'Urbanist',
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontFamily: 'Urbanist',),
        iconTheme: IconThemeData(color: Colors.white)),
    primaryColor: Colors.black,
    primaryColorDark: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
  );

  static final lightTheme = ThemeData(
    fontFamily: 'Urbanist',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontFamily: 'Urbanist',),
        iconTheme: IconThemeData(color: Colors.black)),
    primaryColor: Colors.white,
    primaryColorDark: Colors.black,
    iconTheme: IconThemeData(color: Colors.black),
  );

}