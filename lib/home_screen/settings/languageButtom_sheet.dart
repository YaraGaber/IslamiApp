import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:islamii/provider/app_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      height: 200,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.chengeLanuage('en');
              setState(() {}); // Rebuild the bottom sheet when the language changes
            },
            child: provider.applanguage == "en"
                ? selectedItemWidget(
                AppLocalizations.of(context)!.english, true)
                : unselectedItemWidget(
                AppLocalizations.of(context)!.english, false),
          ),
          SizedBox(height: 18),
          InkWell(
            onTap: () {
              provider.chengeLanuage('ar');
              setState(() {}); // Rebuild the bottom sheet when the language changes
            },
            child: provider.applanguage == 'ar'
                ? selectedItemWidget(AppLocalizations.of(context)!.arabic, true)
                : unselectedItemWidget(
                AppLocalizations.of(context)!.arabic, false),
          ),
        ],
      ),
    );
  }

  Widget selectedItemWidget(String text, bool isSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
        isSelected ? Icon(Icons.check, size: 35, color: Theme.of(context).primaryColor) : SizedBox(),
      ],
    );
  }

  Widget unselectedItemWidget(String text, bool isSelected) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
