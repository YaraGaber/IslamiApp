import 'package:flutter/material.dart';
import 'package:islamii/home_screen/quran/suraDetailsScreen.dart';
class SuraItem extends StatelessWidget {
  String name ;
  int index;
  SuraItem({required this.name,required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(  SuraDetials.routeName,
        arguments: SuraItemArgs(suraName:name ,index:index )
        );
      },
      child: Text(name,textAlign: TextAlign.center,
       style: Theme.of(context).textTheme.titleMedium),
    );
  }
}


class SuraItemArgs{
  String suraName ;
  int index;
  SuraItemArgs({required this.suraName,required this.index});
}