import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/hadeth/hadeth_click.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<hadeth> HadethAll = [];

  @override
  Widget build(BuildContext context) {
    if (HadethAll.isEmpty) readHadethFile();
    return HadethAll.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/hadeth_logo.png',
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) {
                return hadethClick(HadethAll[index]);
              },
              itemCount: HadethAll.length,
              separatorBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  color: Theme.of(context).primaryColor,
                  width: double.infinity,
                  height: 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void readHadethFile() async {
    String filecontent =
    await rootBundle.loadString('assets/ahadeth/ahadeth.txt');
    List<hadeth> ahadethOfFile = [];
    List<String> allHadeth = filecontent.trim().split('#');
    for (int i = 0; i < allHadeth.length; i++) {
      List<String> hadethLine = allHadeth[i].trim().split('\n');
      String title = hadethLine[0];
      hadethLine.removeAt(0);
      String content = hadethLine.join('\n');
      hadeth h = hadeth(title, content);
      ahadethOfFile.add(h);
    }
    HadethAll = ahadethOfFile;
    setState(() {});
  }
}

class hadeth {
  String title;
  String content;

  hadeth(this.title, this.content);
}