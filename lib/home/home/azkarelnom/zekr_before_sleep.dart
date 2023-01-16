import 'package:flutter/material.dart';
import 'package:islami/constants/constants.dart';

class ZekrBeforeSleep extends StatelessWidget {
  String zekr;
  int index;

  ZekrBeforeSleep(this.zekr,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            '$zekr',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 7.0,),
          Text(
            '{${timesOfAzkarBeforeSleep[index]}}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}