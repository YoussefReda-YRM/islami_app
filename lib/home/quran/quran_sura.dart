import 'package:flutter/material.dart';

// المصحف
class QuranSura extends StatelessWidget {
  String verses;
  int index;

  QuranSura(this.verses, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      child: Text(
        '$verses { ${index + 1} } ',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}