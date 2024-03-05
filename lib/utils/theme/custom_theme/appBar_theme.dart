import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppBarThemeData {
  AppBarThemeData._();

//light theme
  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: AppColor.black,
      size: AppSizes.iconMd,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColor.black,
      size: AppSizes.iconMd,
    ),
    titleTextStyle: TextStyle(
      fontSize: AppSizes.fontSizeLg,
      fontWeight: FontWeight.w600,
      color: AppColor.black,
    ),
  );

  //dark theme
  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: AppColor.white,
      size: AppSizes.iconMd,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColor.white,
      size: AppSizes.iconMd,
    ),
    titleTextStyle: TextStyle(
      fontSize: AppSizes.fontSizeLg,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}
