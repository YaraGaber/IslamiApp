import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';
class Radio1 extends StatelessWidget {
  // int number =30 ;
  // String text ='سبحان الله' ;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png'),
        SizedBox(height: 20
        ),
        Center(child: Text("اذاعة القران الكريم " ,
          style: provider.isDark() == true?
              Theme.of(context).textTheme.titleMedium
              :
          Theme.of(context).textTheme.titleMedium
        )),
        SizedBox(height: 10
        ),
        provider.isDark() == true?
            Image.asset('assets/images/Group 5  d.png')
            :
          Image.asset('assets/images/Group 5.png'),
      ],
    );
  }
}
