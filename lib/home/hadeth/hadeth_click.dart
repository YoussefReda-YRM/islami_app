import 'package:flutter/material.dart';
import 'package:islami/Home/Hadeth/Hadeth.dart';
import 'package:islami/home/hadeth/hadeth_tap.dart';

class hadethClick extends StatelessWidget {
  hadeth Hadeth_contact;

  hadethClick(this.Hadeth_contact);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Hadeth.routeName,
            arguments: Hadeth_contact);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                Hadeth_contact.title,
                style: Theme.of(context).textTheme.headline2,
              )),
        ],
      ),
    );
  }
}