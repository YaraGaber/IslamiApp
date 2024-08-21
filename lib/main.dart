import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/home_screen/Home.dart';
import 'package:islamii/home_screen/quran/suraDetailsScreen.dart';
import 'package:islamii/Theme/my_theme.dart';
import 'package:islamii/provider/RadioProvider.dart';
import 'package:islamii/provider/app_provider.dart';
import 'package:provider/provider.dart';

import 'home_screen/hadeth/hadethDetailsScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => RadioProvider()), // Add RadioProvider here
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          initialRoute: Home.routename,
          debugShowCheckedModeBanner: false,
          theme: MyTheme.lightmood,
          themeMode: provider.appTheme,
          darkTheme: MyTheme.darkmood,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(provider.applanguage),
          routes: {
            Home.routename: (context) => Home(),
            SuraDetials.routeName: (context) => SuraDetials(),
            HadethDetialsScreen.routeName: (context) => HadethDetialsScreen(),
          },
        );
      },
    );
  }
}
