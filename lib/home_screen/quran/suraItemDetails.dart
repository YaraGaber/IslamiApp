import 'package:flutter/material.dart';
import 'package:islamii/home_screen/quran/suraDetailsScreen.dart';
class SuraItemDetails extends StatelessWidget {
  String name ;
  int index;
  SuraItemDetails({required this.name,required this.index});
  @override
  Widget build(BuildContext context) {
    return Text('$name{${index+1}}',
        textAlign: TextAlign.center,
     textDirection:TextDirection.rtl ,
     style: Theme.of(context).textTheme.titleSmall);
  }
}
