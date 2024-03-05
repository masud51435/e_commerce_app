import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppTextFieldTheme {
  AppTextFieldTheme._();

  ///light
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColor.darkGrey,
    suffixIconColor: AppColor.darkGrey,
    labelStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeMd,
      color: AppColor.black,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeSm,
      color: AppColor.black,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: AppColor.black.withOpacity(0.4),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        AppSizes.inputFieldRadius,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: AppColor.darkGrey,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        AppSizes.inputFieldRadius,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: AppColor.darkGrey,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        AppSizes.inputFieldRadius,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: AppColor.darkGrey,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        AppSizes.inputFieldRadius,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: AppColor.warning,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        AppSizes.inputFieldRadius,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: AppColor.warning,
      ),
    ),
  );

  ///dark
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColor.darkGrey,
    suffixIconColor: AppColor.darkGrey,
    labelStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeMd,
      color: AppColor.white,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeSm,
      color: AppColor.white,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: AppColor.white.withOpacity(0.4),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        AppSizes.borderRadiusLg,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: AppColor.darkGrey,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        AppSizes.borderRadiusLg,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: AppColor.darkGrey,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        AppSizes.borderRadiusLg,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: AppColor.white,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        AppSizes.borderRadiusLg,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: AppColor.warning,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        AppSizes.borderRadiusLg,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: AppColor.warning,
      ),
    ),
  );
}
