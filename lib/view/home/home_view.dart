import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/core/design/app_image.dart';
import 'package:open_fashion/core/design/custom_app_bar.dart';
import 'package:open_fashion/core/design/title_text.dart';
import 'package:open_fashion/core/logic/helper_methods.dart';
import 'package:open_fashion/core/utils/app_color.dart';
import 'package:open_fashion/core/utils/assets.dart';
import 'package:open_fashion/core/utils/spacing.dart';
import 'package:open_fashion/core/utils/text_style_theme.dart';
import 'package:open_fashion/models/product_model.dart';
import 'package:open_fashion/view/screens/checkout_screen.dart';
import '../../models/cover_model.dart';
import '../widget/custom_about.dart';

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
                          return GestureDetector(
                            onTap: () {
                              navigateTo(
                                toPage: CheckoutScreen(
                                  img: item.image,
                                  price: item.price,
                                  desc: item.description,
                                  name: item.name,
                              ),
                              );
                            },
                            child: Column(
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
                            ),
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
                    CustomAbout(),
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