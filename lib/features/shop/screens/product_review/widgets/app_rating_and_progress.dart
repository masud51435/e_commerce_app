import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utlities.dart';

class AppRatingProcessIndicator extends StatelessWidget {
  const AppRatingProcessIndicator({
    super.key,
    required this.value,
    required this.text,
  });

  final double value;
  final String text;

  @override
  Widget build(BuildContext context) {
    final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItem,
        ),
        SizedBox(
          width: width * 0.53,
          child: LinearProgressIndicator(
            value: value,
            minHeight: height * 0.015,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
            valueColor: const AlwaysStoppedAnimation(AppColor.primaryColor),
          ),
        ),
      ],
    );
  }
}
