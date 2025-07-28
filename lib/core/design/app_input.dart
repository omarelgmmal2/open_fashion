import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/core/utils/app_color.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? type;
  final double paddingBottom, paddingTop;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const AppInput({
    super.key,
    this.controller,
    required this.hintText,
    this.paddingBottom = 16,
    this.paddingTop = 0,
    this.type,
    this.onFieldSubmitted,
    this.focusNode,
    this.textInputAction,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: widget.paddingBottom, top: widget.paddingTop),
      child: TextFormField(
        style: TextStyle(fontSize: 14.sp,color: Colors.black),
        keyboardType: widget.type,
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        controller: widget.controller,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: (value) {
          return "Please Fill The Filed";
        },
        cursorColor: AppColor.black,
        decoration: InputDecoration(
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.gray,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.gray,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.black,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: "TenorSans",
            color: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}
