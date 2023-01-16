import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier
{
  String currentLang = 'ar';
  ThemeMode currentTheme = ThemeMode.dark;

  void changeTheme(ThemeMode newTheme) async
  {
    final prefs = await SharedPreferences.getInstance();
    if(newTheme == currentTheme)
    {
      return;
    }
    currentTheme = newTheme;
    prefs.setString(
      'theme', currentTheme == ThemeMode.light ? 'light' : 'dark');

    notifyListeners();
  }

  void changeLanguage(String newLang) async
  {
    final prefs = await SharedPreferences.getInstance();
    if(currentLang == newLang)
    {
      return;
    }
    currentLang = newLang;
    prefs.setString(
      'Lang', currentLang);
    notifyListeners();
  }

  bool isDarkMode()
  {
    return currentTheme == ThemeMode.dark;
  }

  String getMainBackGround()
  {
    return isDarkMode()
      ? 'assets/images/main_background_dark.png'
      : 'assets/images/main_background.png';
  }

  String getMainSebha_head()
  {
    return isDarkMode()
        ? 'assets/images/head_sebha_dark.png'
        : 'assets/images/head_sebha_logo.png';
  }

  String getMainSebha()
  {
    return isDarkMode()
        ? 'assets/images/body_sebha_dark.png'
        : 'assets/images/body_sebha_logo.png';
  }
}