
import 'package:flutter/material.dart';
import 'package:islamii/home_screen/quran/quran.dart';
import 'package:islamii/home_screen/settings/setting.dart';
import 'package:provider/provider.dart';
import '../my_theme.dart';
import 'package:islamii/home_screen/hadeth/hadeth.dart';
import 'package:islamii/home_screen/sb7a/sb7a.dart';
import 'package:islamii/home_screen/radio/radio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../provider/app_provider.dart';


class Home extends StatefulWidget{
  static const String routename = "home";

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
   return Stack(
     children: [

       provider.isDark() == true ?
       Image.asset(
           'assets/images/bg.png',
       height: double.infinity,
       width: double.infinity,
       fit: BoxFit.fill
       )
           :
       Image.asset(
           'assets/images/bg3.png',
           height: double.infinity,
           width: double.infinity,
           fit: BoxFit.fill
       )  ,
       Scaffold(
        appBar: AppBar(
          title:Text(AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge
               ) ,


        ),
         bottomNavigationBar:  Theme(
           data:Theme.of(context).copyWith(
             canvasColor: Theme.of(context).primaryColor
           ) ,
           child: BottomNavigationBar(
             currentIndex: selectedIndex ,
             onTap: (index) {
               selectedIndex = index;
               setState(() {

               });
             },
             items: [
               BottomNavigationBarItem(
                   icon: ImageIcon(AssetImage('assets/images/moshaf_blue.png')),
                   label: AppLocalizations.of(context)!.quran,
               ),
               BottomNavigationBarItem(
                 icon:  ImageIcon(AssetImage('assets/images/sebha_blue.png')),
                 label:AppLocalizations.of(context)!.tasbeh,
               ),
               BottomNavigationBarItem(
                 icon:  ImageIcon(AssetImage('assets/images/quran-quran-svgrepo-com.png')),
                 label: AppLocalizations.of(context)!.hadeth,
               ),
               BottomNavigationBarItem(
                 icon:  ImageIcon(AssetImage('assets/images/radio.png')),
                 label: AppLocalizations.of(context)!.radio,
               ),
               BottomNavigationBarItem(
                 icon:  Icon(Icons.settings),
                 label: AppLocalizations.of(context)!.setting,
               ),
               // BottomNavigationBarItem(
               //   icon:  ImageIcon(AssetImage('assets/images/radio.png')),
               //   label: AppLocalizations.of(context)!.,
               // ),
             ],
           ),
         ) ,
         body: tabs[selectedIndex],
       )
     ],
   );
  }
  List < Widget> tabs = [
    Quran() ,Sbha(),HadethTab(),Radio1(),Settings()
  ] ;
}