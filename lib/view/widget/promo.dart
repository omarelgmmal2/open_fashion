import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/core/design/app_image.dart';
import 'package:open_fashion/core/design/title_text.dart';
import 'package:open_fashion/core/utils/assets.dart';
import 'package:open_fashion/core/utils/spacing.dart';
import 'package:open_fashion/core/utils/text_style_theme.dart';

class Promo extends StatelessWidget {
  const Promo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          verticalSpace(20),
          Divider(),
          verticalSpace(10),
          SizedBox(
            height: 44.h,
            width: 315.w,
            child: Row(
              children: [
                AppImage(
                  AppImages.promo,
                  height: 24.h,
                  width: 24.h,
                ),
                horizontalSpace(10),
                CustomTextWidget(
                  label: "Add promo code",
                  style: TextStyleTheme.textStyle14Regular,
                ),
              ],
            ),
          ),
          verticalSpace(5),
          Divider(),
          verticalSpace(10),
          SizedBox(
            height: 44.h,
            width: 315.w,
            child: Row(
              children: [
                AppImage(
                  AppImages.delivery,
                  height: 24.h,
                  width: 24.h,
                ),
                horizontalSpace(10),
                CustomTextWidget(
                  label: "Delivery",
                  style: TextStyleTheme.textStyle14Regular,
                ),
                Spacer(),
                CustomTextWidget(
                  label: "FREE",
                  style: TextStyleTheme.textStyle14Regular,
                ),
                horizontalSpace(5),
              ],
            ),
          ),
          verticalSpace(10),
          Divider(),
        ],
      ),
    );
  }
}
