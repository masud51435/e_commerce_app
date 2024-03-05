import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.color = AppColor.white,
    this.child,
    this.radius = 500,
    this.padding = 0,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  final Color color;
  final Widget? child;
  final double radius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}