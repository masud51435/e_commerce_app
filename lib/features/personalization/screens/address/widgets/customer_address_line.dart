import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shape/container/rounded_container.dart';
import '../../../../../common/widgets/text/section_heading/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utlities.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CustomerAddressLine extends StatelessWidget {
  const CustomerAddressLine({
    super.key,
    this.selected = false,
    this.onTap,
  });
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final width = AppDeviceUtils.getScreenWidth();
    final dark = AppHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: AppRoundedContainer(
        width: width,
        showBorder: true,
        padding: const EdgeInsets.all(AppSizes.md),
        margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItem),
        color: selected
            ? dark
                ? AppColor.darkerGrey
                : AppColor.accent
            : AppColor.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSectionHeading(
              text: 'John Smith',
              anotherItem: selected
                  ? const Icon(Iconsax.tick_circle)
                  : const SizedBox.shrink(),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItem / 2,
            ),
            const Text('+8801829346266'),
            const SizedBox(
              height: AppSizes.spaceBtwItem / 2,
            ),
            const Text(
              '394734 Main Street, New York, New York 1000l, United State',
            ),
          ],
        ),
      ),
    );
  }
}
