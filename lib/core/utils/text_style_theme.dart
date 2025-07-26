import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';
import 'font_weight_helper.dart';

class TextStyleTheme {
  static TextStyle textStyle12SemiBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.primary,
  );

  static TextStyle textStyle18medium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.black,
  );

  static TextStyle textStyle18mediumADLaMDisplay = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.white,
  );
}