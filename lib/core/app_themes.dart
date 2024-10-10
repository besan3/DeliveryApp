import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_texts.dart';


abstract class AppThemes{
  static ThemeData lightTheme=ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor:Colors.black),
    primaryColor: Colors.black,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor:  AppColors.backgroundColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          fontFamily:AppTexts.fontFamily,
          fontSize: AppSizes.fontSize20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryColor
      )
    ),
    primaryTextTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily:AppTexts.fontFamily,
        fontSize: AppSizes.fontSize24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimaryColor
      ),
      titleMedium: TextStyle(
          fontFamily:AppTexts.fontFamily,
          fontSize: AppSizes.fontSize16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.subTitleColor,
      ),
      displayMedium: TextStyle(
          fontFamily:AppTexts.fontFamily,
          fontSize: AppSizes.fontSize16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.backgroundColor,
      ),
        displaySmall: TextStyle(
          fontFamily:AppTexts.fontFamily,
          fontSize: AppSizes.fontSize14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.hintColor,
      ),
      bodySmall:TextStyle(
        fontFamily:AppTexts.fontFamily,
        fontSize: AppSizes.fontSize12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.hintColor,
      ),
      bodyMedium: TextStyle(
        fontFamily:AppTexts.fontFamily,
        fontSize: AppSizes.fontSize18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor,
      ),
    )
  ) ;
}