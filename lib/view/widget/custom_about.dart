import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import '../../core/design/app_image.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_style_theme.dart';

class CustomAbout extends StatelessWidget {
  const CustomAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Ionicons.logo_twitter,color: AppColor.white),
            horizontalSpace(30),
            Icon(Ionicons.logo_instagram,color: AppColor.white),
            horizontalSpace(30),
            Icon(Ionicons.logo_facebook,color: AppColor.white),


          ],
        ),
        verticalSpace(20),
        AppImage(AppImages.line,width: 190.w),
        verticalSpace(20),
        CustomTextWidget(
            label: "support@openui.design \n       +60 825 876 \n08:00 - 22:00 - Everyday",
            maxLines: 3,
            style: TextStyleTheme.textStyle16Regular
        ),
        verticalSpace(20),
        AppImage(AppImages.line,width: 190.w),
        verticalSpace(20),
        CustomTextWidget(
            maxLines: 3,
            label: "About   Contact    Blog",
            style: TextStyleTheme.textStyle16Regular
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 30.h,top: 10.h),
          child: Center(
            child: CustomTextWidget(
              maxLines: 3,
              label: "Copyright© OpenUI All Rights Reserved.",
              style: TextStyleTheme.textStyle12Regular.copyWith(
                height: 2.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
