import 'package:flutter/material.dart';

import '../../../../../common/widgets/app_banner_rounded_image/banner_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utlities.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CartImage extends StatelessWidget {
  const CartImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final height = AppDeviceUtils.getScreenHeight();
    return AppRoundedImage(
      imageUrl: AppImages.productImage1,
      height: height * 0.08,
      padding: const EdgeInsets.all(AppSizes.sm),
      fit: BoxFit.cover,
      backgroundColor: dark ? AppColor.darkerGrey : AppColor.light,
    );
  }
}