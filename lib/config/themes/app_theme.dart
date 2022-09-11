import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.secondary,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.primary,
      fontFamily: AppStrings.fontFamily,
      textTheme: TextTheme(
        labelLarge:TextStyle(
            fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400),
        labelMedium: TextStyle(
            fontSize: 20, color: AppColors.white, fontWeight: FontWeight.w500),
        labelSmall:  TextStyle(
            fontSize: 14,
            color: AppColors.white,
            fontWeight: FontWeight.w400),
        titleMedium: TextStyle(
            fontSize: 18,
            color: AppColors.secondary,
            fontWeight: FontWeight.w500),
        titleLarge:  TextStyle(
            fontSize: 20, color: AppColors.white, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(
            fontSize: 14,
            color: AppColors.gray,
            fontWeight: FontWeight.w500),


      ));
}
