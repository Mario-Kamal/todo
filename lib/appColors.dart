import 'package:flutter/material.dart';

class AppColors {
  static Color mainColor = Colors.white;
  static Color textColor = const Color(0xffFF0000);
  static Color contBackColor = const Color(0xffFF4444);
  static Color floatingColor = const Color(0xffFF4444);
  static Color iconColor = const Color(0xffFF0000);
  static Color bottomNavColor = Colors.white;
  static Color bottomIconColor = Colors.black;

  AppColors.lightTheme() {
    mainColor = Colors.white;
    textColor = const Color(0xffFF0000);
    contBackColor = const Color(0xffFF4444);
    floatingColor = const Color(0xffFF4444);
    iconColor = const Color(0xffFF0000);
    bottomNavColor = Colors.white;
    bottomIconColor = Colors.black;
  }

  AppColors.dark() {
    mainColor = Colors.black;
    textColor = Colors.white;
    contBackColor = const Color(0xff2B2727);
    floatingColor = const Color(0xffBF0000);
    iconColor = Colors.white;
    bottomNavColor = const Color(0xff0E0D0E);
    bottomIconColor = Colors.white;
  }
}
