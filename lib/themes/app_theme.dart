// ignore_for_file: prefer_const_constructors, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picterest_app/constant/colors_constant.dart';
import 'package:picterest_app/constant/texts_contstant.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      unselectedWidgetColor: AppColors.unSelectedColor,
      brightness: Brightness.light,
      primaryColor: AppColors.whiteColor,
      errorColor: AppColors.dangerColor,
      colorScheme: ColorScheme.light().copyWith(primary: AppColors.blackColor),
      scaffoldBackgroundColor: AppColors.whiteColor,
      androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.blackColor),
        titleTextStyle: TextStyle(color: AppColors.blackColor),
        brightness: Brightness.light,
        backgroundColor: AppColors.lightColor,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.blackColor,
          onPrimary: AppColors.whiteColor,
          elevation: 0,
          textStyle: TextTheme().button,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
        backgroundColor: Colors.white,
        unselectedItemColor: AppColors.unSelectedColor,
        selectedItemColor: AppColors.primaryColor,
        enableFeedback: false,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyles.text12SemiBold,
        unselectedLabelStyle: AppTextStyles.text12,
      ),
      inputDecorationTheme: InputDecorationTheme().copyWith(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.w),
        labelStyle:
            AppTextStyles.text16.copyWith(color: AppColors.lightGreyColor),
        errorStyle: AppTextStyles.text12.copyWith(color: AppColors.dangerColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: AppColors.outlineColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: AppColors.dangerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: AppColors.dangerColor),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.light().copyWith(
      unselectedWidgetColor: AppColors.unSelectedColor,
      brightness: Brightness.light,
      primaryColor: AppColors.darkBlackColor,
      errorColor: AppColors.dangerColor,
      colorScheme: ColorScheme.light().copyWith(primary: AppColors.blackColor),
      scaffoldBackgroundColor: AppColors.darkBlackColor,
      androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.blackColor),
        titleTextStyle: TextStyle(color: AppColors.blackColor),
        brightness: Brightness.light,
        backgroundColor: AppColors.lightColor,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.blackColor,
          onPrimary: AppColors.whiteColor,
          elevation: 0,
          textStyle: TextTheme().button,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
        backgroundColor: AppColors.darkBlackColor,
        unselectedItemColor: AppColors.whiteColor.withOpacity(0.2),
        selectedItemColor: AppColors.primaryColor,
        enableFeedback: false,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyles.text12SemiBold,
        unselectedLabelStyle: AppTextStyles.text12,
      ),
      inputDecorationTheme: InputDecorationTheme().copyWith(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.w),
        labelStyle:
            AppTextStyles.text16.copyWith(color: AppColors.lightGreyColor),
        errorStyle: AppTextStyles.text12.copyWith(color: AppColors.dangerColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: AppColors.outlineColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: AppColors.dangerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: AppColors.dangerColor),
        ),
      ),
    );
  }
}
