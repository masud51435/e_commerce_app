import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class VerifiedBrandLogo extends StatelessWidget {
  const VerifiedBrandLogo({
    super.key,
    required this.brandName,
    this.doStyle = false,
    this.textStyle,
    this.size = AppSizes.iconSm,
    this.maxline = 1,
  });

  final String brandName;
  final bool doStyle;
  final TextStyle? textStyle;
  final double size;
  final int maxline;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            brandName,
            maxLines: maxline,
            style:
                doStyle ? textStyle : Theme.of(context).textTheme.labelMedium,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          width: AppSizes.xs,
        ),
        Icon(
          Icons.verified,
          size: size,
          color: AppColor.primaryColor,
        ),
      ],
    );
  }
}
