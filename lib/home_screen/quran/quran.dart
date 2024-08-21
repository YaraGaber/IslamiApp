import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/home_screen/hadeth/contant_quran.dart'; // Assuming this is the correct import for contant_quran.dart
import 'package:islamii/home_screen/quran/suraItem.dart';
import 'package:islamii/Theme/my_theme.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class Quran extends StatelessWidget {
  late var provider;

  List<String> suraName = contant
      .suraNames; // Assuming contant is correctly defined in contant_quran.dart
  List<int> verses = contant
      .versesNumber; // Assuming contant is correctly defined in contant_quran.dart

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        Expanded(
            flex: 3,
            child:
                Center(child: Image.asset('assets/images/Screenshot (1).png'))),
        SizedBox(height: 15),
        Expanded(
          flex: 7,
          child: Stack(
            children: [
              buildExpanded(context),
              provider.isDark() == true
                  ? Center(
                      child: Container(
                        width: 3,
                        height: double.infinity,
                        color: MyTheme.yallow,
                      ),
                    )
                  : Center(
                      child: Container(
                        width: 3,
                        height: double.infinity,
                        color: MyTheme.lightmood.primaryColor,
                      ),
                    )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildExpanded(BuildContext context) {
    return Column(
      children: [
        provider.isDark() == true
            ? Container(
                height: 3,
                width: double.infinity,
                color: MyTheme.yallow,
              )
            : Container(
                height: 3,
                width: double.infinity,
                color: MyTheme.lightmood.primaryColor,
              ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              provider.isDark() == true
                  ? Text(AppLocalizations.of(context)!.sura_name,
                      style: MyTheme.darkbold)
                  : Text(AppLocalizations.of(context)!.sura_name,
                      style: Theme.of(context).textTheme.titleMedium),
              provider.isDark() == true
                  ? Text(AppLocalizations.of(context)!.versesNumber,
                      style: MyTheme.darkbold)
                  : Text(AppLocalizations.of(context)!.versesNumber,
                      style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
        provider.isDark() == true
            ? Container(
                height: 3,
                width: double.infinity,
                color: MyTheme.yallow,
              )
            : Container(
                height: 3,
                width: double.infinity,
                color: MyTheme.lightmood.primaryColor,
              ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemCount: suraName.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: SuraItem(
                      name: suraName[index],
                      index: index,
                    ),
                  ),
                  provider.isDark() == true
                      ? Expanded(
                          child: Text(
                            '${verses[index]}',
                            textAlign: TextAlign.center,
                            style: MyTheme.darksemibold,
                          ),
                        )
                      : Expanded(
                          child: Text(
                            '${verses[index]}',
                            textAlign: TextAlign.center,
                            style: MyTheme.regularTitle,
                          ),
                        )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
