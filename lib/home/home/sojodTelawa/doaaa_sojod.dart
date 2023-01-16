import 'package:flutter/material.dart';
class DoaaaSojod extends StatelessWidget {
  String zekr;

  DoaaaSojod(this.zekr);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      child: Text(
        '$zekr',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}