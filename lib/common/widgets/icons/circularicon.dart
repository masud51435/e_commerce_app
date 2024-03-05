import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppCircularIcon extends StatelessWidget {
  const AppCircularIcon(
      {super.key,
      this.height,
      this.width,
      required this.icon,
      this.color,
      this.backgroundColor,
      this.onPress,
      this.radius = 100,
      this.size = AppSizes.lg});

  final double? height, width, size;
  final double radius;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor != null
            ? backgroundColor!
            : dark
                ? AppColor.black.withOpacity(0.9)
                : AppColor.white.withOpacity(0.7),
      ),
      child: IconButton(
        onPressed: onPress,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
