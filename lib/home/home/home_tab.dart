import 'package:flutter/material.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:islami/home/home/azkarAfterSalah/azkar_after_salah_display.dart';
import 'package:islami/home/home/azkarelnom/azkar_before_sleep_display.dart';
import 'package:islami/home/home/elazkar/azkarmasaa/azkarmasaa_details_display.dart';
import 'package:islami/home/home/sojodTelawa/sojod_telawa_display.dart';
import 'package:provider/provider.dart';

import 'elazkar/azkarsabah/azkarsabah_details_display.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: [
              Image.asset(
                'assets/images/hadeth_logo.png',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: ()
                        {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AzkarSabah()));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Theme.of(context).primaryColorLight,
                            border: Border.all(
                                color: Color(0xFFFACC1D)
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              'أذكار الصباح',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: settingsProvider.isDarkMode() ? Colors.white: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        onTap: ()
                        {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AzkarMasaa()));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Theme.of(context).primaryColorLight,
                            border: Border.all(
                                color: Color(0xFFFACC1D)
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              'أذكار المساء',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: settingsProvider.isDarkMode() ? Colors.white: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        onTap: ()
                        {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AzkarAfterSalah()));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Theme.of(context).primaryColorLight,
                            border: Border.all(
                                color: Color(0xFFFACC1D)
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              'أذكار بعد الصلاة',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: settingsProvider.isDarkMode() ? Colors.white: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        onTap: ()
                        {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AzkarBeforeSleep()));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Theme.of(context).primaryColorLight,
                            border: Border.all(
                                color: Color(0xFFFACC1D)
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              'أذكار قبل النوم',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: settingsProvider.isDarkMode() ? Colors.white: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        onTap: ()
                        {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SojodTelawa()));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Theme.of(context).primaryColorLight,
                            border: Border.all(
                                color: Color(0xFFFACC1D)
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              'دعاء سجود التلاوة',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: settingsProvider.isDarkMode() ? Colors.white: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}