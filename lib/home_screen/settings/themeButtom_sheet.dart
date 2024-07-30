import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:islamii/provider/app_provider.dart';
class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
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
            onTap: (){
              provider.chengeTheme(ThemeMode.light);

            },
            child: provider.appTheme == ThemeMode.light?
              selectedItemWidget(AppLocalizations.of(context)!.light_mode)
                  :
              unslectedItemWidget
                (AppLocalizations.of(context)!.light_mode)
          ) ,
          SizedBox(height: 18,),
          InkWell(
            onTap: () {
              provider.chengeTheme(ThemeMode.dark);
            },
            child: provider.isDark()?
            selectedItemWidget(AppLocalizations.of(context)!.dark_mode)
            :
            unslectedItemWidget(AppLocalizations.of(context)!.dark_mode),
          )
        ],
      ),
    );
  }
   selectedItemWidget(String text){
     return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).primaryColor
            )),
        Icon(Icons.check,size: 35,color: Theme.of(context).primaryColor,)
      ],
    );
  }
   unslectedItemWidget(String text){
   return Row(

      children: [
        Text(text,
          style: Theme.of(context).textTheme.titleSmall,),
      ],
    );
  }
}
