import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/design/app_image.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_style_theme.dart';

class Header extends StatelessWidget {
  final String text;
  const Header({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            verticalSpace(15),
            CustomTextWidget(
              label: text.toUpperCase(),
              style: TextStyleTheme.textStyle18Regular.copyWith(
                color: AppColor.black,
                letterSpacing: 4,
              ),
            ),
            AppImage(
              AppImages.line,
              width: 125.w,
              color: AppColor.black,
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
