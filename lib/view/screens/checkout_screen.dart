import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/core/design/custom_app_bar.dart';
import 'package:open_fashion/core/design/title_text.dart';
import 'package:open_fashion/core/logic/helper_methods.dart';
import 'package:open_fashion/core/utils/spacing.dart';
import 'package:open_fashion/core/utils/text_style_theme.dart';
import 'package:open_fashion/view/screens/place_order_screen.dart';
import 'package:open_fashion/view/widget/cart_widget.dart';
import 'package:open_fashion/view/widget/header.dart';
import 'package:open_fashion/view/widget/promo.dart';
import '../../core/design/app_button.dart';
import '../../core/design/app_image.dart';
import '../../core/utils/assets.dart';

class CheckoutScreen extends StatefulWidget {
  final String img;
  final double price;
  final String desc;
  final String name;

  const CheckoutScreen({
    super.key,
    required this.img,
    required this.price,
    required this.desc,
    required this.name,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  int selectedQty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlack: false),
      body: Column(
        children: [
          Header(text: "Checkout"),
          CartWidget(
              desc: widget.desc,
              img: widget.img,
              name: widget.name,
              price: widget.price,
            qty: selectedQty,
            onChanged: (value) {
              setState(() {
                selectedQty = value;
              });
            },
          ),
          Promo(),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  label: "Est. Total",
                  style: TextStyleTheme.textStyle14Regular,
                ),
                CustomTextWidget(
                  label: "\$ ${widget.price * selectedQty}",
                  style: TextStyleTheme.textStyle15Regular,
                ),
              ],
            ),
          ),
          verticalSpace(25),
          AppButton(
            textStyle: TextStyleTheme.textStyle16Regular.copyWith(height: 1.5),
            text: "Checkout".toUpperCase(),
            icon: AppImage(
                height: 20.h,
                width: 20.h,
                AppImages.shoppingBag,
            ),
            onPress: () {
              navigateTo(
                  toPage: PlaceOrderScreen(
                    image: widget.img,
                    name: widget.name,
                    desc: widget.desc,
                    qty: selectedQty,
                    price: widget.price,
                    total: widget.price * selectedQty,
                  ),
              );
            },
          ),
        ],
      ),
    );
  }
}
