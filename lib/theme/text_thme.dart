import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/theme/appcolors.dart';
TextTheme appTextTheme = TextTheme(
  bodySmall: defaultTextTheme,
  bodyMedium: splashText20Theme,
  bodyLarge: splashText32Theme,
);
TextStyle defaultTextTheme = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.bold,
  color: AppColors.textColor,
);
TextStyle splashText32Theme = TextStyle(
  fontSize: 32.sp,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
TextStyle splashText20Theme = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
