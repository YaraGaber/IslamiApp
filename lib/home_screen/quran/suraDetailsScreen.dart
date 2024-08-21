import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamii/Theme/my_theme.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';
import 'suraItem.dart';
import 'suraItemDetails.dart';

class SuraDetials extends StatefulWidget {
  static const String routeName = 'SuraDetials';

  @override
  State<SuraDetials> createState() => _SuraDetialsState();
}

class _SuraDetialsState extends State<SuraDetials> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraItemArgs;
    var provider = Provider.of<AppProvider>(context);
    if (verses.isEmpty) {
      reloadFile(args.index);
    }
    return Stack(children: [
      provider.isDark() == true
          ? Image.asset('assets/images/bg.png',
              height: double.infinity, width: double.infinity, fit: BoxFit.fill)
          : Image.asset('assets/images/bg3.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill),
      Scaffold(
          appBar: AppBar(
            title: provider.isDark() == true
                ? Text('${args.suraName}',
                    style: Theme.of(context).textTheme.titleSmall)
                : Text('${args.suraName}',
                    style: Theme.of(context).textTheme.titleMedium),
          ),
          body: verses.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.06,
                  ),
                  decoration: provider.isDark() == true
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: MyTheme.dark)
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return SuraItemDetails(name: verses[index], index: index);
                    },
                    itemCount: verses.length,
                  ),
                )),
    ]);
  }

  void reloadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split("\n");
    verses = lines;
    setState(() {});
  }
}
