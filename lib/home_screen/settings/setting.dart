import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/home_screen/settings/languageButtom_sheet.dart';
import 'package:islamii/home_screen/settings/themeButtom_sheet.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.titleMedium),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                provider.applanguage == 'en'
                    ? Text(AppLocalizations.of(context)!.english,
                        style: Theme.of(context).textTheme.titleSmall)
                    : Text(AppLocalizations.of(context)!.arabic,
                        style: Theme.of(context).textTheme.titleSmall),
                InkWell(
                    onTap: () {
                      showLanguageBottomSheet();
                    },
                    child: Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 30,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.titleMedium),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    provider.isDark()
                        ? AppLocalizations.of(context)!.dark_mode
                        : AppLocalizations.of(context)!.light_mode,
                    style: Theme.of(context).textTheme.titleSmall),
                InkWell(
                    onTap: () {
                      showThemeBottomSheet();
                    },
                    child: Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 30,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
