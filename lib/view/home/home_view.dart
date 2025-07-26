import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:open_fashion/core/design/app_image.dart';
import 'package:open_fashion/core/design/custom_app_bar.dart';
import 'package:open_fashion/core/design/title_text.dart';
import 'package:open_fashion/core/utils/app_color.dart';
import 'package:open_fashion/core/utils/assets.dart';
import 'package:open_fashion/core/utils/spacing.dart';
import 'package:open_fashion/core/utils/text_style_theme.dart';
import 'package:open_fashion/models/product_model.dart';
import '../../models/cover_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: CustomAppBar(isBlack: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: AppImage(
                  AppImages.number10,
                  height: 125.28.h,
                  width: 173.66.w,
                ),
              ),
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: AppImage(
                  AppImages.october,
                  height: 63.h,
                  width: 163.w,
                ),
              ),
              Positioned(
                top: 70,
                left: 0,
                right: 0,
                child: AppImage(
                  AppImages.collection,
                  height: 29.12.h,
                  width: 145.59.w,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(92),
                    AppImage(
                      AppImages.cover1,
                    ),
                    verticalSpace(20),
                    GridView.builder(
                      itemCount:  ProductModel.products.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.50,
                        ),
                        itemBuilder: (context, index) {
                        final item = ProductModel.products[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppImage(
                                  item.image,
                              ),
                              verticalSpace(10),
                              CustomTextWidget(
                                  label: item.name,
                                style: TextStyleTheme.textStyle12Regular,
                              ),
                              CustomTextWidget(
                                  label: item.description,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleTheme.textStyle12Regular,
                              ),
                              verticalSpace(8),
                              CustomTextWidget(
                                  label: "\$ ${item.price.toString()}",
                                style: TextStyleTheme.textStyle15Regular,
                              ),
                            ],
                          );
                        },
                    ),
                    verticalSpace(5),
                    CustomTextWidget(
                        label: "You may also like".toUpperCase(),
                      style: TextStyleTheme.textStyle18Regular,
                    ),
                    verticalSpace(10),
                    AppImage(
                      AppImages.line,
                      width: 190.w,
                    ),
                    verticalSpace(30),
                    SizedBox(
                      height: 400.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: CoverModel.covers.length,
                        itemBuilder: (context , index){
                          final item = CoverModel.covers[index];
                          return Padding(
                            padding: EdgeInsets.all(8.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppImage(
                                    item.image,
                                    height: 300.h,
                                    fit: BoxFit.cover,
                                ),
                                verticalSpace(10),
                                CustomTextWidget(
                                    label: item.name.toUpperCase(),
                                  style: TextStyleTheme.textStyle12Regular,
                                ),
                              ],
                            ),
                          );

                        },
                      ),
                    ),
                    about(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget about() {
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