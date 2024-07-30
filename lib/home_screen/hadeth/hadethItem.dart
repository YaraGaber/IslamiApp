import 'package:flutter/material.dart';
import 'package:islamii/home_screen/quran/suraDetailsScreen.dart';
import 'hadeth.dart';

import 'hadethDetailsScreen.dart';
class HadethItem extends StatelessWidget {
  String name ;
  Hadeth hadeth ;
  // int index;
  HadethItem({required this.name,required this.hadeth});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(  HadethDetialsScreen.routeName,
        arguments: hadeth
        );
      },
      child: Text(name,textAlign: TextAlign.center,
       style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
