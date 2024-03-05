import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmerLoader extends StatelessWidget {
  const AppShimmerLoader({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Get.isDarkMode ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color:
              color ?? (Get.isDarkMode ? AppColor.darkerGrey : AppColor.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
