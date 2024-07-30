import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamii/my_theme.dart';
import 'package:provider/provider.dart';
import '../../provider/app_provider.dart';
import 'hadethItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List <Hadeth>  hadethList =[];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    if(hadethList.isEmpty){
    hadethloadFile();
    }
    return  Column(
      children: [
        Center(child: Image.asset('assets/images/59253-quran-basmala-islamic-kufic-arabic-calligraphy-icon.png')),
        Divider(
            thickness: 2,
            color: provider.isDark() == true ?
            MyTheme.yallow
                :
            MyTheme.lightmood.primaryColor
        ),
        Text(AppLocalizations.of(context)!.hadeth_name
            ,style: Theme.of(context).textTheme.titleMedium) ,
        Divider(
            thickness: 2,
            color: provider.isDark() == true ?
            MyTheme.yallow
                :
            MyTheme.lightmood.primaryColor
        ),
        hadethList.isEmpty?
        Center(child: CircularProgressIndicator())
            :
        Expanded(
            child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 2,
                color: provider.isDark() == true ?
                MyTheme.yallow
            :
                Theme.of(context).primaryColor

            ,
    );
    },
             itemBuilder: (BuildContext context, int index) {
            return HadethItem(hadeth: hadethList[index],name:hadethList[index].name,
            );
                 },
              itemCount: hadethList.length,
                   ),
    ),
      ],
    );
  }

  void hadethloadFile ()async{
    String hadeth = await rootBundle.loadString('assets/files/ahadeth.txt');
    List <String> hadethContent= hadeth.split('#\r\n');
    for(int i =0 ; i<hadethContent.length ; i++){
      List <String> hadethLines=  hadethContent[i].split('\n');
     String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth HadethData = Hadeth(name: title, content: hadethLines);
      hadethList.add(HadethData);

      setState(() {

      });

    }
  }
}
class Hadeth{
  String name ;
  List <String> content ;
  Hadeth({required this.name ,required this.content});

}