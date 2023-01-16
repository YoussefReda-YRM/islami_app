import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:islami/constants/constants.dart';
import 'package:islami/home/home/sojodTelawa/doaaa_sojod.dart';
import 'package:provider/provider.dart';

class SojodTelawa extends StatefulWidget {
  static const String routeName = 'SojodTelawa';

  @override
  State<SojodTelawa> createState() => _SojodTelawaState();
}

class _SojodTelawaState extends State<SojodTelawa> {

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    String bsmala = '';

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.getMainBackGround()),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Text('دعاء سجود التلاوة'),
            ),
            body: azkarsabah.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 180,
                  child: Text(
                    bsmala,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                // محتويات صفحة الأذكار
                Expanded(
                  child: Container(
                    padding: const EdgeInsetsDirectional.all(25),
                    child: Container(
                      padding: const EdgeInsetsDirectional.all(0),
                      margin: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: ListView.separated(
                        itemBuilder: (_, index) {
                          return DoaaaSojod(sojodtelawa[index]);
                        },
                        itemCount: sojodtelawa.length,
                        separatorBuilder: (_, index) {
                          return Container(
                            color: Theme.of(context).primaryColor,
                            width: double.infinity,
                            height: 1,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }
}