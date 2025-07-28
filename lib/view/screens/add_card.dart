import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/core/design/app_button.dart';
import 'package:open_fashion/core/design/custom_app_bar.dart';
import 'package:open_fashion/core/utils/spacing.dart';
import '../../core/utils/text_style_theme.dart';
import '../widget/header.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isShow = false;

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(isBlack: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(text: "Payment method"),
              /// visa card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CreditCardWidget(
                  padding: 6,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isShow,
                  onCreditCardWidgetChange: (v) {},
                  cardBgColor: Colors.black,
                  obscureCardCvv: false,
                  obscureCardNumber: true,
                  isHolderNameVisible: true,
                ),
              ),
              verticalSpace(20),
              /// form
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CreditCardForm(
                  formKey: key,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  isCardHolderNameUpperCase: true,
                  obscureCvv: false,
                  inputConfiguration: InputConfiguration(
                    cardNumberTextStyle: TextStyle(fontFamily: "TenorSans",color: Colors.black),
                    cardNumberDecoration: InputDecoration(
                      hintText: "Card Number",
                      hintStyle: TextStyle(fontFamily: "TenorSans",color: Colors.black),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    cardHolderTextStyle: TextStyle(fontFamily: "TenorSans",color: Colors.black),
                    cardHolderDecoration: InputDecoration(
                      hintText: "Card Number",
                      hintStyle: TextStyle(fontFamily: "TenorSans",color: Colors.black),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    cvvCodeTextStyle: TextStyle(fontFamily: "TenorSans",color: Colors.black),
                    cvvCodeDecoration: InputDecoration(
                      hintText: "CVV",
                      hintStyle: TextStyle(fontFamily: "TenorSans",color: Colors.black),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    expiryDateTextStyle: TextStyle(fontFamily: "TenorSans",color: Colors.black),
                    expiryDateDecoration: InputDecoration(
                      hintText: "Expiry Date",
                      hintStyle: TextStyle(fontFamily: "TenorSans",color: Colors.black),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpace(178),
              AppButton(
                textStyle: TextStyleTheme.textStyle16Regular.copyWith(height: 1.5),
                text: "ADD CARD",
                onPress: () {
                  if(key.currentState!.validate()) {
                    final data = {
                      'number' : cardNumber,
                      'name' : cardHolderName,
                      'date' : expiryDate,
                      'cvv' : cvvCode,
                    };
                    Navigator.pop(context,data);
                  }
                },
              ),
              verticalSpace(70),
            ],
          ),
        ),
      ),
    );
  }


  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      expiryDate = data.expiryDate;
      isShow = data.isCvvFocused;
    });
  }

}