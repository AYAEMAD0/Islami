import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_route.dart';
import 'package:islami/core/utils/app_theme.dart';
import 'package:islami/screens/home/tabs/quran/sura_details/sura_details.dart';
import 'package:islami/screens/home/tabs/quran/sura_details_without_line/sura_details_without_line.dart';
import '../home/home_screen.dart';
import '../home/tabs/hadeth/details_hadeth/hadeth_details.dart' show HadethDetails;
import '../onboarding/onboarding_screen.dart';


class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.themeDark,
      themeMode: ThemeMode.dark,
      initialRoute: AppRoute.homeRouteName,
      routes: {
        AppRoute.onBoardingRouteName:(context)=>OnboardingScreen(),
        AppRoute.homeRouteName:(context)=>HomeScreen(),
        AppRoute.suraDetailsRouteName:(context)=>SuraDetails(),
        AppRoute.suraDetailsWithoutLineRouteName:(context)=>SuraDetailsWithoutLine(),
        AppRoute.hadethDetailsRouteName:(context)=>HadethDetails()
      },
    );
  }
}