import 'package:flutter/material.dart';

class AppColors {
  static Color mainColor = Colors.white;
  static Color textColor = const Color(0x50FF0000);
  static Color appBarColor = const Color(0xffe1e1e1);
  static Color appBarIconColor = const Color(0xffD1CDCD);
  static Color contBackColor = const Color(0xffFF4444);
  static Color floatingColor = const Color(0xffFF4444);
  static Color iconColor = const Color(0xffFF0000);
  static Color bottomNavColor = Colors.white;
  static Color bottomUnselectedIconColor = Colors.black;
  static Color splashScreenColor = const Color(0xffFF4444);
  static Color bottomSelectedItemColor = const Color(0xffFF4444).withOpacity(0.7);

  AppColors.lightTheme() {
    mainColor = Colors.white;
    textColor = const Color(0xffFF0000);
    contBackColor = const Color(0xffFF4444);
    floatingColor = const Color(0xffFF4444);
    iconColor = const Color(0xffFF0000);
    bottomNavColor = Colors.white;
    bottomUnselectedIconColor = Colors.black;
  }

  AppColors.dark() {
    mainColor = Colors.black;
    textColor = Colors.white;
    contBackColor = const Color(0xff2B2727);
    floatingColor = const Color(0xffBF0000);
    iconColor = Colors.white;
    bottomNavColor = const Color(0xff0E0D0E);
    bottomUnselectedIconColor = Colors.white;
  }
}
