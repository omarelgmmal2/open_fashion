import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/core/design/app_button.dart';
import 'package:open_fashion/core/design/app_image.dart';
import 'package:open_fashion/core/design/title_text.dart';
import 'package:open_fashion/core/utils/app_color.dart';
import 'package:open_fashion/core/utils/assets.dart';
import 'package:open_fashion/core/utils/spacing.dart';
import 'package:open_fashion/core/utils/text_style_theme.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 480.h,
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(CupertinoIcons.clear),
              ),
              onTap: () => Navigator.pop(context),
            ),
            verticalSpace(20),
            CustomTextWidget(
              label: "Payment success".toUpperCase(),
              style: TextStyleTheme.textStyle18Regular.copyWith(
                color: AppColor.black,
              ),
            ),
            verticalSpace(30),
            AppImage(AppImages.done,width: 60),
            verticalSpace(20),
            CustomTextWidget(
              label: "Your payment was success",
              style: TextStyleTheme.textStyle18Regular.copyWith(
                color: AppColor.black,
              ),
            ),
            verticalSpace(20),
            CustomTextWidget(
              label: "Payment ID 15263541".toUpperCase(),
              style: TextStyleTheme.textStyle15Regular.copyWith(
                color: AppColor.gray
              ),
            ),
            verticalSpace(20),
            AppImage(AppImages.line,color: Colors.black,width: 120),
            verticalSpace(20),
            CustomTextWidget(
              label: "Rate your purchase".toUpperCase(),
              style: TextStyleTheme.textStyle18Regular.copyWith(
                color: AppColor.black,
              ),
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  AppImage(AppImages.emogi1),
                horizontalSpace(20),
                AppImage(AppImages.emogi2),
                horizontalSpace(20),
                AppImage(AppImages.emogi3),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                      textStyle: TextStyleTheme.textStyle16Regular.copyWith(height: 1.5),
                      text: "Submit",
                      onPress: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
                ),
                horizontalSpace(20),
                Expanded(
                  child: AppButton(
                      textStyle: TextStyleTheme.textStyle16Regular.copyWith(height: 1.5),
                      text: "Cancel",
                      onPress: () {
                    Navigator.pop(context);
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}