import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/design/app_image.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/font_weight_helper.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_style_theme.dart';

class CartWidget extends StatefulWidget {
  final String img;
  final double price;
  final String desc;
  final String name;
  final int qty;
  final Function(int) onChanged;

  const CartWidget({
    super.key,
    required this.img,
    required this.price,
    required this.desc,
    required this.name,
    required this.qty,
    required this.onChanged,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {

  late int number;

  @override
  void initState() {
    number = 1;
    number = widget.qty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage(widget.img, height: 135.h, width: 100.w),
          horizontalSpace(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(10),
              CustomTextWidget(
                label: widget.name.toUpperCase(),
                style: TextStyleTheme.textStyle14Regular.copyWith(
                  letterSpacing: 4,
                ),
              ),
              verticalSpace(5),
              CustomTextWidget(
                label: widget.desc,
                style: TextStyleTheme.textStyle12Regular.copyWith(
                  color: AppColor.black,
                ),
              ),
              verticalSpace(10),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 16.w),
                    height: 24.h,
                    width: 24.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColor.gray),
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (number > 1) {
                          setState(() {
                            number--;
                            widget.onChanged(number);
                          });
                        }
                      },
                      alignment: AlignmentDirectional.topCenter,
                      padding: EdgeInsets.only(right: 1),
                      icon: Icon(Icons.minimize, size: 18, color: AppColor.black),
                    ),
                  ),
                  CustomTextWidget(
                    label: number.toString(),
                    style: TextStyleTheme.textStyle16Regular.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.w),
                    height: 24.h,
                    width: 24.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.gray),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          number++;
                          widget.onChanged(number);
                        });
                      },
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsets.only(right: 1),
                      icon: Icon(Icons.add, size: 18, color: AppColor.black),
                    ),
                  ),
                ],
              ),
              verticalSpace(8),
              CustomTextWidget(
                label: "\$${widget.price}",
                style: TextStyleTheme.textStyle15Regular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
