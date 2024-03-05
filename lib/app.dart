import 'package:e_commerce_app/binidings/general_binding.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/Theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBinding(),
      home: const CupertinoPageScaffold(
        backgroundColor: AppColor.primaryColor,
        child: Center(
          child: CupertinoActivityIndicator(
            color: AppColor.white,
            radius: AppSizes.iconMd,
          ),
        ),
      ),
    );
  }
}
