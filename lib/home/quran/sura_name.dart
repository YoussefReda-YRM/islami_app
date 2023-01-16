import 'package:flutter/material.dart';
import 'package:islami/Home/Quran/sura_details_display.dart';

class SuraName extends StatelessWidget {
  String Name;
  int num;

  SuraName(this.Name, this.num);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Sura.routeName,
              arguments: SuraDitails(num, Name));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 80,
                child: Text(
                  Name,
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.start,
                )),
            Container(
              color: Theme.of(context).primaryColor,
              width: 2,
              height: 50,
            ),
            SizedBox(
                width: 70,
                child: Text('${1 + num}',
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}