// ignore_for_file: prefer_const_constructors, camel_case_types, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:picterest_app/constant/colors_constant.dart';

class SnackbarHelper {
  static showError({required String description}) {
    if (!Get.isSnackbarOpen) {
      Get.showSnackbar(GetBar(
        message: "😢 $description",
        mainButton: GestureDetector(
          onTap: () {
            if (Get.isSnackbarOpen) Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(right: 10.w),
            child: Icon(
              Icons.close,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
        borderRadius: 4,
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 1),
        backgroundColor: AppColors.dangerColor,
        snackPosition: SnackPosition.TOP,
      ));
    }
  }

  static showSuccess({required String description}) {
    if (!Get.isSnackbarOpen) {
      Get.showSnackbar(GetBar(
        message: "👌 $description",
        mainButton: GestureDetector(
          onTap: () {
            if (Get.isSnackbarOpen) Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(right: 10.w),
            child: Icon(
              Icons.close,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
        borderRadius: 4,
        backgroundColor: AppColors.successColor,
        snackPosition: SnackPosition.TOP,
      ));
    }
  }

  static showInfo({required String description}) {
    if (!Get.isSnackbarOpen) {
      Get.showSnackbar(GetBar(
        message: "ℹ️ $description",
        mainButton: GestureDetector(
          onTap: () {
            if (Get.isSnackbarOpen) Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(right: 10.w),
            child: Icon(
              Icons.close,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
        borderRadius: 4,
        backgroundColor: AppColors.infoColor,
        snackPosition: SnackPosition.TOP,
      ));
    }
  }
}
