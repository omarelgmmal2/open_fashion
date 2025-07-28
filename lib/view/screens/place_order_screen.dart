import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/core/design/title_text.dart';
import 'package:open_fashion/core/logic/helper_methods.dart';
import 'package:open_fashion/core/utils/app_color.dart';
import 'package:open_fashion/core/utils/spacing.dart';
import 'package:open_fashion/core/utils/text_style_theme.dart';
import 'package:open_fashion/view/screens/add_address.dart';
import 'package:open_fashion/view/screens/add_card.dart';
import 'package:open_fashion/view/widget/custom_container.dart';
import '../../core/design/app_button.dart';
import '../../core/design/app_image.dart';
import '../../core/design/custom_app_bar.dart';
import '../../core/utils/assets.dart';
import '../widget/cart_widget.dart';
import '../widget/dialog.dart';
import '../widget/header.dart';

class PlaceOrderScreen extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  final String desc;
  final int qty;
  final double total;

  const PlaceOrderScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.desc,
    required this.qty,
    required this.total,
  });

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  dynamic savedAddress;
  dynamic savedCard;
  late int selectedQty;

  @override
  void initState() {
    selectedQty = widget.qty;
    super.initState();
  }

  void openAddress(BuildContext context) async {
    final addressData = await navigateTo(toPage: AddAddress());

    if (addressData != null) {
      setState(() {
        savedAddress = addressData;
      });
    }
  }

  void editAddress() async {
    final newAddress = await navigateTo(
      toPage: AddAddress(editData: savedAddress),
    );
    setState(() {
      savedAddress = newAddress;
    });
  }

  void openCard () async {
    final cardData = await navigateTo(toPage: AddCard());

    if (cardData != null) {
      setState(() {
        savedCard = cardData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlack: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(text: "Checkout"),
          verticalSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomTextWidget(
              label: "Shipping adress".toUpperCase(),
              style: TextStyleTheme.textStyle14Regular.copyWith(
                color: Colors.black38,
              ),
            ),
          ),
          verticalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(5),
              savedAddress != null
                  ? GestureDetector(
                      onTap: editAddress,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          savedAddress != null
                              ? Column(
                                  children: [
                                    CustomTextWidget(
                                      label:
                                          "${savedAddress["first"]} ${savedAddress["last"]}",
                                      style: TextStyleTheme.textStyle18Regular
                                          .copyWith(color: AppColor.black),
                                    ),
                                    CustomTextWidget(
                                      overflow: TextOverflow.ellipsis,
                                      label: "${savedAddress["address"]}",
                                      style: TextStyleTheme.textStyle14Regular
                                          .copyWith(color: AppColor.gray),
                                    ),
                                    CustomTextWidget(
                                      overflow: TextOverflow.ellipsis,
                                      label: "${savedAddress["city"]}",
                                      style: TextStyleTheme.textStyle14Regular
                                          .copyWith(color: AppColor.gray),
                                    ),
                                    CustomTextWidget(
                                      label:
                                          "${savedAddress["phone"]}\n${savedAddress["Zip"]}",
                                      style: TextStyleTheme.textStyle14Regular
                                          .copyWith(color: AppColor.gray),
                                    ),
                                  ],
                                )
                              : SizedBox.shrink(),
                          savedAddress == null
                              ? GestureDetector(
                                  onTap: () {
                                    openAddress(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 18,
                                    color: AppColor.black,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
              verticalSpace(3),
            ],
          ),
          verticalSpace(12),
          CustomContainer(
            text: "Add shipping address",
            isFree: false,
            icon: GestureDetector(
              onTap: () {
                navigateTo(toPage: AddAddress());
              },
              child: Icon(Icons.add, color: AppColor.black),
            ),
          ),
          verticalSpace(36),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: savedCard != null && savedAddress != null ? SizedBox.shrink() : CustomTextWidget(
              label: "Shipping Method".toUpperCase(),
              style: TextStyleTheme.textStyle14Regular.copyWith(
                color: Colors.black38,
              ),
            ),
          ),
          verticalSpace(12),
          CustomContainer(
            text: "Pickup at store",
            isFree: true,
            icon: Icon(Icons.arrow_drop_down, color: AppColor.black),
          ),
          verticalSpace(36),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child:  savedCard != null && savedAddress != null ? SizedBox.shrink() :CustomTextWidget(
              label: "Payment method".toUpperCase(),
              style: TextStyleTheme.textStyle14Regular.copyWith(
                color: Colors.black38,
              ),
            ),
          ),
          verticalSpace(12),
          savedCard != null ? Column(
            children: [
              Divider(color: Colors.grey.shade300),
              verticalSpace(20),
              Row(
                children: [
                  AppImage(AppImages.mastercard,width: 40.w),
                  verticalSpace(10),
                  CustomTextWidget(
                      label: "Master Card ending",
                    style: TextStyleTheme.textStyle14Regular,
                  ),
                  verticalSpace(10),
                  CustomTextWidget(
                    label: "••••${savedCard['number'].toString().substring(savedCard['number'].length - 2)}",
                    style: TextStyleTheme.textStyle14Regular,
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                    color: AppColor.black,
                  )
                ],
              ),
              verticalSpace(20),
              Divider(color: Colors.grey.shade300),
            ],
          ) :
          GestureDetector(
            onTap: openCard,
            child: CustomContainer(
              text: "select payment method",
              isFree: false,
              icon: Icon(Icons.arrow_drop_down, color: AppColor.black),
            ),
          ),
          verticalSpace(20),
          savedCard != null && savedAddress != null ? CartWidget(
            img: widget.image,
            name:  widget.name,
            desc:  widget.desc,
            price:  widget.price,
            qty: widget.qty,
            onChanged: (qty) => setState(() => selectedQty = qty),
          ) : SizedBox.shrink(),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  label: "Total",
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
            text: "Place order".toUpperCase(),
            icon: AppImage(height: 20.h, width: 20.h, AppImages.shoppingBag),
            onPress: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Dialog(
                      child: CustomDialog(),
                    );
                  }
              );
            },
          ),
        ],
      ),
    );
  }
}
