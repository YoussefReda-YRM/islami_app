import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:islami/constants/constants.dart';
import 'package:islami/home/home/elazkar/zekr_display.dart';
import 'package:provider/provider.dart';

class AzkarMasaa extends StatefulWidget {
  static const String routeName = 'AzkarMasaa';

  @override
  State<AzkarMasaa> createState() => _AzkarMasaaState();
}

class _AzkarMasaaState extends State<AzkarMasaa> {

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    String bsmala = 'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم';

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.getMainBackGround()),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Text('أذكار المساء'),
            ),
            body: azkarmasaa.isEmpty
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
                          return ZekrDisplay(azkarmasaa[index],index);
                        },
                        itemCount: azkarmasaa.length,
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