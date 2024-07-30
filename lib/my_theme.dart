import 'package:flutter/material.dart';
class MyTheme {
  static Color black = Color(0xff242424);
  static Color light = Color(0xffB7935F);
  static Color dark = Color(0xff141A2E);
  static Color yallow = Color(0xffFACC1D);
  static Color white = Color(0xffF8F8F8);
  static  TextStyle regularTitle =  TextStyle(
      fontSize: 25 ,
      fontWeight: FontWeight.w400,
     color: MyTheme.black
  );
  static  TextStyle darkbold = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 25,
  color: white,
  );
  static  TextStyle  darksemibold =TextStyle(
  fontSize: 25 ,
  fontWeight: FontWeight.w400,
  color: white
  );
  static  TextStyle  darksemiboldYallow =TextStyle(
      fontSize: 25 ,
      fontWeight: FontWeight.w400,
      color: yallow
  );
  static ThemeData lightmood= ThemeData(
    canvasColor: light,
    primaryColor: light,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor:  Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: black)
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 30,
        color: black,
      ),
      titleMedium: TextStyle(
        fontSize: 25 ,
        fontWeight: FontWeight.w600,
        color: black
      ),
        titleSmall: TextStyle(
            fontSize: 25 ,
            fontWeight: FontWeight.w400,
            color: black
        ),

    ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     selectedItemColor: black,
     showUnselectedLabels: true ,

   ),

  );
  static ThemeData darkmood= ThemeData(
    canvasColor: light,
    primaryColor: dark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor:  Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: yallow)
    ),
    textTheme: TextTheme(
        titleMedium: TextStyle(
            fontSize: 25 ,
            fontWeight: FontWeight.w600,
            color: white,
        )
        ,
            titleLarge: TextStyle(
              fontSize: 30 ,
              fontWeight: FontWeight.w600,
              color: white,
            ),

        titleSmall: TextStyle(
            fontSize: 25 ,
            fontWeight: FontWeight.w400,
            color: yallow
        )

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: yallow,
      showUnselectedLabels: true ,

    ),

  );
}
