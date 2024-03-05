import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: AppColor.darkGrey.withOpacity(0.1),
    blurRadius: 90,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
  
  static final horizontalProductShadow = BoxShadow(
    color: AppColor.darkGrey.withOpacity(0.1),
    blurRadius: 90,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
