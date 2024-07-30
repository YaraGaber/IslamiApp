import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../my_theme.dart';
import '../../provider/app_provider.dart';
import 'hadeth.dart';
import 'hadethItemDetails.dart';

class HadethDetialsScreen extends StatefulWidget {
  static const String routeName = 'HadethDetials';

  @override
  State<HadethDetialsScreen> createState() => _HadethDetialsScreenState();
}

class _HadethDetialsScreenState extends State<HadethDetialsScreen> {

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
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
          )
       ,
    Scaffold(
    appBar: AppBar(
    title:Text('${args.name}',
    style: provider.isDark() == true ?
      Theme.of(context).textTheme.titleSmall
        :
     Theme.of(context).textTheme.titleSmall
    ) ,


    ),
    body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width*0.05 ,
          vertical: MediaQuery.of(context).size.height*0.06 ,
        ),
        decoration: provider.isDark() == true ?
        BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: MyTheme.dark
        )
            :
        BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white
        ),
      child: ListView.builder(itemBuilder: (context, index) {
            return HadethItemDetails(content: args.content[index] ) ;
      },
      itemCount:args.content.length ),
    )
    ) ,
        ]);
  }

}
