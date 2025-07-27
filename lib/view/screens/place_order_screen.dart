import 'package:flutter/material.dart';
import '../../core/design/custom_app_bar.dart';
import '../widget/header.dart';

class PlaceOrderScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlack: false),
      body: Column(
          children: [
            Header(text: "Checkout"),
          ],
      ),
    );
  }
}
