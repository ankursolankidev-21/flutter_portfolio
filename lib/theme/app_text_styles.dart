import 'package:flutter/material.dart';
import 'package:my_cv_web/theme/app_colors.dart';

class AppText {

  static TextStyle headerName() => TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.headerText);
  static TextStyle headerSubHeading() => TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.headerSubText);
  static TextStyle headerText() => TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: AppColors.headerSubText);

  static TextStyle titleText(bool isDark) => TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? AppColors.darkText : AppColors.lightText);
  static TextStyle titleSubText(bool isDark) => TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: isDark ? AppColors.darkText : AppColors.lightText);
  static TextStyle infoText(bool isDark) => TextStyle(fontSize: 16, color: isDark ? AppColors.darkSubText : AppColors.lightSubText);

  static TextStyle infoSubText(bool isDark) => TextStyle(fontSize: 12, color: isDark ? AppColors.darkAccent : AppColors.lightAccent);

  static TextStyle accentText(bool isDark) => TextStyle(fontSize: 16, color: isDark ? AppColors.darkAccent : AppColors.lightAccent);
}

// class AppText {
//   static TextStyle header(Color c) => TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: c);
//
//   static TextStyle subHeader(Color c) => TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: c);
//
//   static TextStyle body(Color c) => TextStyle(fontSize: 18, height: 1.5, color: c);
//
//   static TextStyle small(Color c) => TextStyle(fontSize: 16, color: c);
// }
