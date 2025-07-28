import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/core/design/app_button.dart';
import 'package:open_fashion/core/design/app_input.dart';
import 'package:open_fashion/core/design/custom_app_bar.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_style_theme.dart';
import '../widget/header.dart';

class AddAddress extends StatefulWidget {
  final dynamic editData;
  const AddAddress({super.key, this.editData});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneController = TextEditingController();

  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  final cityFocusNode = FocusNode();
  final stateFocusNode = FocusNode();
  final zipCodeFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

  @override
  void initState() {
    if(widget.editData != null) {
      firstNameController.text = widget.editData['first'] ?? "";
      lastNameController.text = widget.editData['last'] ?? "";
      addressController.text = widget.editData['address'] ?? "";
      cityController.text = widget.editData['city'] ?? "";
      stateController.text = widget.editData['state'] ?? "";
      zipCodeController.text = widget.editData['Zip'] ?? "";
      phoneController.text = widget.editData['phone'] ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlack: false),
      body: Column(
        children: [
          Header(text: "Add shipping adress"),
          verticalSpace(25),
          Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppInput(
                          hintText: 'First name',
                          controller: firstNameController,
                          focusNode: firstNameFocusNode,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(lastNameFocusNode);
                          },
                          type: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      horizontalSpace(16),
                      Expanded(
                        child: AppInput(
                          hintText: 'Last name',
                          controller: lastNameController,
                          focusNode: lastNameFocusNode,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(addressFocusNode);
                          },
                          type: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(30),
                  AppInput(
                      hintText: 'Address',
                      controller: addressController,
                    focusNode: addressFocusNode,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(cityFocusNode);
                    },
                    type: TextInputType.streetAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  verticalSpace(30),
                  AppInput(
                      hintText: 'City',
                      controller: cityController,
                    focusNode: cityFocusNode,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(stateFocusNode);
                    },
                    type: TextInputType.streetAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  verticalSpace(30),
                  Row(
                    children: [
                      Expanded(
                        child: AppInput(
                          hintText: 'State',
                          controller: stateController,
                          focusNode: stateFocusNode,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(zipCodeFocusNode);
                          },
                          type: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      horizontalSpace(16),
                      Expanded(
                        child: AppInput(
                          hintText: 'ZIP Code',
                          controller: zipCodeController,
                          focusNode: zipCodeFocusNode,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(phoneFocusNode);
                          },
                          type: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(30),
                  AppInput(
                    hintText: 'Phone Number',
                    controller: phoneController,
                    focusNode: phoneFocusNode,
                    type: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          AppButton(
            text: "Add now",
            textStyle: TextStyleTheme.textStyle16Regular.copyWith(height: 1.5),
            onPress: () {
              if(formKey.currentState!.validate()) {
                return;
              } else {
                final data = {
                  'first' : firstNameController.text,
                  'last' : lastNameController.text,
                  'address' : addressController.text,
                  'Zip' : zipCodeController.text,
                  'city' : cityController.text,
                  'phone' : phoneController.text,
                };
                Navigator.pop(context, data);
              }
            },
          ),
        ],
      ),
    );
  }
}
