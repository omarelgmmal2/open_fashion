import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_color.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.white,
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.black,
        shape: RoundedRectangleBorder(),
        elevation: 0.0,
        fixedSize: Size(375.w,56.h),
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.white,
          height: 1.5,
          fontFamily: "TenorSans",
        ),
      ),
    ),
  );
}
