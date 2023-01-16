import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:islami/home/quran/quran_sura.dart';
import 'package:provider/provider.dart';

class Sura extends StatefulWidget {
  static const String routeName = 'Sura';

  @override
  State<Sura> createState() => _SuraState();
}

class _SuraState extends State<Sura> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraDitails;
    String bsmala = ' ';
    if (args.index != 4) {
      bsmala = 'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ';
    }
    if (verses.isEmpty) ReadFile(args.index);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.getMainBackGround()),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Text('سورة ${args.title}'),
            ),
            body: verses.isEmpty
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
                // محتويات صفحة الصورة
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
                          return QuranSura(verses[index], index);
                        },
                        itemCount: verses.length,
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
            )));
  }

  void ReadFile(int index) async {
    String content =
    await rootBundle.loadString('assets/Quran/${index + 1}.txt');
    int num = 0;
    List<String> line = content.trim().split("\n");
    verses = line;
    setState(() {});
  }
}

class SuraDitails {
  int index;
  String title;

  SuraDitails(this.index, this.title);
}