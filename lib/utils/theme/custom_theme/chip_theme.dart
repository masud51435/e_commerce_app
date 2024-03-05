import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: AppColor.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: AppColor.black),
    selectedColor: AppColor.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: AppColor.white,
  );
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: AppColor.grey,
    labelStyle: TextStyle(color: AppColor.white),
    selectedColor: AppColor.primaryColor,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: AppColor.white,
  );
}
