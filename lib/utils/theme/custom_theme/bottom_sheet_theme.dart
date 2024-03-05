import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppBottomSheetTheme {
  AppBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColor.white,
    modalBackgroundColor: AppColor.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        AppSizes.borderRadiusXl,
      ),
    ),
    constraints: const BoxConstraints(
      minWidth: double.infinity,
    ),
  );
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColor.black,
    modalBackgroundColor: AppColor.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        AppSizes.borderRadiusXl,
      ),
    ),
    constraints: const BoxConstraints(
      minWidth: double.infinity,
    ),
  );
}
