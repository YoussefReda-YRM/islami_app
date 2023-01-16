import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:islami/home/hadeth/hadeth_tap.dart';
import 'package:islami/home/home/home_tab.dart';
import 'package:islami/home/prayerTimings/prayer_timings.dart';
import 'package:islami/home/quran/quran_tap.dart';
import 'package:islami/home/sebha/sebha_tap.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 2;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    List<String> title = [
      AppLocalizations.of(context)!.quran_title,
      AppLocalizations.of(context)!.hadeth_title,
      'أسلامي',
      AppLocalizations.of(context)!.tasbeh_title,
      'مواقيت الصلاة'
    ];
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(settingsProvider.getMainBackGround()),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(title[selectedTabIndex]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: (index) {
            selectedTabIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_quran.png'),
                ),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon: const ImageIcon(
                    AssetImage('assets/images/icon_hadeth.png')),
                label: AppLocalizations.of(context)!.hadeth),
            BottomNavigationBarItem(
                backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon: const Icon(Icons.home),
                label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
                backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon:
                const ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                label: AppLocalizations.of(context)!.tasbeh),
            BottomNavigationBarItem(
                backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon:
                const ImageIcon(AssetImage('assets/images/Mosque.png')),
                label: 'الصلاة'),
          ],
        ),
        body: tabs[selectedTabIndex],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    HomeTab(),
    SebhaTab(),
    PrayerTimings(),
  ];
}