import 'package:e_commerce_app/common/widgets/custom_shape/curver_widge/curve_edges.dart';
import 'package:flutter/material.dart';

class AppCurvedWidget extends StatelessWidget {
  const AppCurvedWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurve(),
      child: child,
    );
  }
}