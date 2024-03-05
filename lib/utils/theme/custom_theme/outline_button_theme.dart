import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppOutlineButtonThem {
  AppOutlineButtonThem._();

  static OutlinedButtonThemeData lightOutlineButtonThemeData =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.dark,
      side: const BorderSide(color: AppColor.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16, color: AppColor.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: AppSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  );
  static OutlinedButtonThemeData darkOutlineButtonThemeData =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.light,
      side: const BorderSide(color: AppColor.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16, color: AppColor.white, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: AppSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  );
}
