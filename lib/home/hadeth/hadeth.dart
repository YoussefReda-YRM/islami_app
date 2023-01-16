import 'package:flutter/material.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:islami/home/hadeth/hadeth_tap.dart';
import 'package:provider/provider.dart';

class Hadeth extends StatelessWidget {
  static const String routeName = 'Hadeth';

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as hadeth;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.getMainBackGround()),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Text(args.title),
            ),
            body: Container(
              width: double.infinity,
              padding: const EdgeInsetsDirectional.all(0),
              margin: const EdgeInsets.only(
                  top: 100, left: 5, right: 5, bottom: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Container(
                            padding: const EdgeInsetsDirectional.all(25),
                            child: Text(
                              args.content,
                              style: Theme.of(context).textTheme.headline2,
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.3,
                            )),
                      ),
                      Container(
                          padding: const EdgeInsetsDirectional.all(0),
                          margin: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            width: double.infinity,
                            height: 1,
                          )),
                    ],
                  ),
                ),
              ),
            )));
  }
}