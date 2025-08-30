import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_route.dart';
import 'package:islami/core/utils/app_theme.dart';
import 'package:islami/screens/onboarding_screen.dart';
import 'home_screen.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.themeDark,
      themeMode: ThemeMode.dark,
      initialRoute: AppRoute.onBoardingRouteName,
      routes: {
        AppRoute.onBoardingRouteName:(context)=>OnboardingScreen(),
        AppRoute.homeRouteName:(context)=>HomeScreen(),
      },
    );
  }
}