import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/view/home/home_view.dart';
import 'core/logic/helper_methods.dart';
import 'core/themes/app_theme.dart';
import 'core/utils/app_strings.dart';

class OpenFashionApp extends StatelessWidget {
  const OpenFashionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
          useInheritedMediaQuery: true,
          navigatorKey: navigatorKey,
          theme: AppTheme.appTheme,
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          home: child,
        ),
      child: const HomeView(),
    );
  }
}
