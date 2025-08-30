import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static final ThemeData themeDark = ThemeData(
    scaffoldBackgroundColor: AppColor.transparentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.primaryColor,
      unselectedItemColor: AppColor.backgroundColor,
      selectedItemColor: AppColor.whiteColor,

      //showSelectedLabels:,
      //showUnselectedLabels:
    ),
  );
}
