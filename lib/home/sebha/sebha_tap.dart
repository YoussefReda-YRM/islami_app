import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int tap = 0;
  int caonter = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
  ];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.4,
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.asset(settingsProvider.getMainSebha_head(),width: 50.0,),
                      top: 35,
                      left: size.width * .48,
                    ),
                    Positioned(
                      child: InkWell(
                          onTap: onPressd_1,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Transform.rotate(
                              angle: angle,
                              child: Image.asset(
                                  settingsProvider.getMainSebha(),),
                          ),
                      ),
                      top: 80,
                      left: size.width * .30,
                      right: size.width * .30,
                    ),
                  ],
                ),
              ),
              Text(
                AppLocalizations.of(context)!.numbertasbeh,
                style: Theme.of(context).textTheme.headline1,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Color(0xFFFACC1D))),
                height: 70,
                width: 60,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 80),
                child: Center(
                    child: Container(
                        margin: const EdgeInsets.only(top: 0, bottom: 0),
                        child: Text(
                          '$tap',
                          style: Theme.of(context).textTheme.headline4,
                        ))),
              ),
              Container(
                width: 180,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Color(0xFFFACC1D))),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 80),
                child: InkWell(
                  onTap: onPressd_1,
                  child: Center(
                      child: Container(
                        alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Text(
                            azkar[caonter],
                            style: Theme.of(context).textTheme.headline1,
                          ))),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    elevation: 20,
                    backgroundColor: Theme.of(context).primaryColorLight,
                    onPressed: onPressd_2,
                    child: Text(
                      'تراجع',
                      style: TextStyle(
                        color: settingsProvider.isDarkMode()
                            ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

  onPressd_1() {
    angle--;
    tap++;
    if (tap == 34) {
      tap = 0;
      caonter++;
    }
    if (caonter == azkar.length) {
      caonter = 0;
    }
    setState(() {});
  }

  onPressd_2() {
    if(tap > 0)
    {
      angle++;
      tap--;
      if (tap == 34) {
        tap = 0;
        caonter++;
      }
      if (caonter == azkar.length) {
        caonter = 0;
      }
      setState(() {});
    }
  }


}