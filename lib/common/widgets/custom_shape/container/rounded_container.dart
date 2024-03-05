import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppRoundedContainer extends StatelessWidget {
  const AppRoundedContainer({
    super.key,
    this.height,
    this.width,
    this.radius = AppSizes.cardRadiusLg,
    this.margin,
    this.padding,
    this.color = AppColor.transparent,
    this.borderColor = AppColor.borderPrimary,
    this.showBorder = false,
    this.child,
    this.onTap,
  });

  final double? height, width;
  final double radius;
  final EdgeInsetsGeometry? margin, padding;
  final Color color, borderColor;
  final bool showBorder;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          border: showBorder ? Border.all(color: borderColor) : null,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child,
      ),
    );
  }
}
