import 'package:flutter/material.dart';
import 'package:islamii/my_theme.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class Sbha extends StatefulWidget {
  @override
  _SbhaState createState() => _SbhaState();
}

class _SbhaState extends State<Sbha> {
  int number = 0;
  double rotationAngle = 10.0;
  List<String> texts = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر'
  ]; // Add more texts as needed
  int currentTextIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            provider.isDark() == true
                ? Positioned(
                    child: Image.asset('assets/images/head of seb7a d.png'))
                : Positioned(
                    child: Image.asset('assets/images/head of seb7a.png'),
                  ),
            GestureDetector(
              onTap: () {
                setState(() {
                  rotationAngle += 20.0;
                  number++;

                  if (number == 33) {
                    number = 0; // Reset number to 0
                    currentTextIndex = (currentTextIndex + 1) % texts.length;
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Transform.rotate(
                  angle: rotationAngle * (3.1415926535 / 180),
                  child: provider.isDark() == true
                      ? Image.asset('assets/images/body of seb7a d.png')
                      : Image.asset('assets/images/body of seb7a.png'),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Center(
            child: Text('عدد التسبيحات',
                style: Theme.of(context).textTheme.titleLarge)),
        Container(
          decoration: provider.isDark() == true
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  shape: BoxShape.rectangle,
                  color: MyTheme.dark,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  shape: BoxShape.rectangle,
                  color: MyTheme.lightmood.primaryColor,
                ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Text(" $number ",
                style: provider.isDark() == true
                    ? MyTheme.regularTitle.copyWith(color: MyTheme.white)
                    : Theme.of(context).textTheme.titleSmall),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: provider.isDark() == true
                ? MyTheme.yallow
                : MyTheme.lightmood.primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Text(
              texts[currentTextIndex],
              style: provider.isDark() == true
                  ? MyTheme.regularTitle
                  : Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ],
    );
  }
}
