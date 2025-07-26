import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/core/utils/app_color.dart';
import 'package:open_fashion/core/utils/spacing.dart';
import '../utils/assets.dart';
import 'app_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBlack;
  const CustomAppBar({super.key, required this.isBlack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: AppBar(
        backgroundColor: isBlack ? AppColor.primary : AppColor.white,
        elevation: 0.0,
        centerTitle: true,
        leadingWidth: 25,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        title: AppImage(
          AppImages.logoBg,
            color: isBlack ? AppColor.white : AppColor.primary
        ),
        actions: [
          AppImage(
            AppImages.search,
              color: isBlack ? AppColor.white : AppColor.primary
          ),
          horizontalSpace(20),
          AppImage(
            AppImages.shoppingBag,
              color: isBlack ? AppColor.white : AppColor.primary
          ),
        ],
        leading: AppImage(
          AppImages.menu,
            color: isBlack ? AppColor.white : AppColor.primary
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
