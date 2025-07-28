import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/text_style_theme.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final bool isFree;
  final Widget icon;

  const CustomContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.isFree,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w),
      margin: EdgeInsets.only(left: 16.w),
      height: 48.h,
      width: 342.w,
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadiusGeometry.circular(44.r),
      ),
      child: Row(
        children: [
          CustomTextWidget(
            label: text,
            style: TextStyleTheme.textStyle16Regular.copyWith(
              color: AppColor.black,
            ),
          ),
          Spacer(),
          isFree
              ? CustomTextWidget(
                  label: "FREE",
                  style: TextStyleTheme.textStyle14Regular,
                )
              : SizedBox.shrink(),
          IconButton(onPressed: () {}, icon: icon),
        ],
      ),
    );
  }
}
