import 'package:flutter/material.dart';
import 'package:open_fashion/core/design/custom_app_bar.dart';
import 'package:open_fashion/core/utils/app_color.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: CustomAppBar(isBlack: true),
      body: SafeArea(
          child: Column(
            children: [

            ],
          ),
      ),
    );
  }
}
