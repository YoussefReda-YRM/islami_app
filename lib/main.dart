import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/Hadeth/Hadeth.dart';
import 'package:islami/Home/Quran/sura_details_display.dart';
import 'package:islami/Home/home_Screen.dart';
import 'package:islami/My_Theme.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(ChangeNotifierProvider<SettingsProvider>(
      create: (buildContext) {
        return SettingsProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider settingsProvider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of<SettingsProvider>(context);
    getsShared();
    return MaterialApp(
      themeMode: settingsProvider.currentTheme,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        Sura.routeName: (_) => Sura(),
        Hadeth.routeName: (_) => Hadeth(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.currentLang),
    );
  }

  void getsShared() async {
    final prefs = await SharedPreferences.getInstance();

    //set language
    settingsProvider.changeLanguage(prefs.getString('lang') ?? 'ar');
//set Theme
    if (prefs.getString('theme') == 'light') {
      settingsProvider.changeTheme(ThemeMode.light);
    } else if (prefs.getString('theme') == 'dark') {
      settingsProvider.changeTheme(ThemeMode.dark);
    }
  }
}