import 'package:flutter/material.dart';

class MyTheme {
  static const TextStyle NavigationBar =
  TextStyle(fontFamily: 'tajawal', fontSize: 14);
  static const Color lightColor = Color(0xFFB7935F);
  static const Color darkColor = Color(0xFFFACC1D);
  static final ThemeData lightTheme = ThemeData(
      backgroundColor: Colors.white,
      primaryColorLight: Color(0xFFB7935F),
      textTheme: TextTheme(
        headline1:
        TextStyle(fontFamily: 'tajawal', fontSize: 20, color: Colors.black),
        headline2:
        TextStyle(fontFamily: 'tajawal', fontSize: 17, color: Colors.black),
        headline3:
        TextStyle(fontFamily: 'quran', fontSize: 25, color: Colors.black),
        headline4:
        TextStyle(fontFamily: 'tajawal', fontSize: 30, color: Colors.black),
      ),
      primaryColor: lightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black, size: 33),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle:
        TextStyle(color: Colors.black, fontSize: 28, fontFamily: 'tajawal'),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFB7935F),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        selectedLabelStyle: MyTheme.NavigationBar,
        selectedIconTheme: const IconThemeData(
          color: Colors.black,
          size: 36,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 28,
        ),
      ),
      fontFamily: 'tajawal');

  static final ThemeData darkTheme = ThemeData(
      backgroundColor: Color(0xFF141A2E),
      primaryColorDark: Color(0xFF14213B),
      primaryColorLight: Color(0xFF141A2E),
      textTheme: TextTheme(
        headline1:
        TextStyle(fontFamily: 'tajawal', fontSize: 20, color: Colors.white),
        headline2:
        TextStyle(fontFamily: 'tajawal', fontSize: 17, color: Colors.white),
        headline3:
        TextStyle(fontFamily: 'quran', fontSize: 25, color: Colors.white),
        headline4:
        TextStyle(fontFamily: 'tajawal', fontSize: 30, color: Colors.white),
      ),
      primaryColor: darkColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white, size: 33),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle:
        TextStyle(color: Colors.white, fontSize: 28, fontFamily: 'tajawal'),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF141A2E),
        selectedIconTheme: const IconThemeData(
          color: darkColor,
          size: 36,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 28,
        ),
        selectedItemColor: darkColor,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: MyTheme.NavigationBar,
      ),
      fontFamily: 'tajawal');
}