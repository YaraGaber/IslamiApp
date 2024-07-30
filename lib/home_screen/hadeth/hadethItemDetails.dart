import 'package:flutter/material.dart';
import 'package:islamii/home_screen/quran/suraDetailsScreen.dart';
class HadethItemDetails extends StatelessWidget {
  String content ;
  HadethItemDetails({required this.content});
  @override
  Widget build(BuildContext context) {
    return Text('$content',
        textAlign: TextAlign.center,
     style: Theme.of(context).textTheme.titleSmall);
  }
}
