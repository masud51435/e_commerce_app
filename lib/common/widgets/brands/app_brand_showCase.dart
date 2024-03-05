import 'package:flutter/material.dart';

import '../app_banner_rounded_image/banner_rounded_image.dart';
import '../custom_shape/container/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_string.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utlities.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'brand_card.dart';

class AppBrandShowCase extends StatelessWidget {
  const AppBrandShowCase({
    super.key,
    required this.imageUrl,
    this.brandName = 'Nike',
    this.brandImg = AppImages.nikeLogo,
    this.itemAvailable = "36 Product Available",
    this.onTap,
  });

  final List<String> imageUrl;
  final String brandName, brandImg, itemAvailable;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    // final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    return AppRoundedContainer(
      margin: const EdgeInsets.only(bottom: AppSizes.defaultSpace),
      width: width,
      padding: const EdgeInsets.all(AppSizes.sm),
      // height: 190,
      showBorder: true,
      color: dark ? AppColor.dark : AppColor.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBrandItemsCard(
            showBorder: false,
            widths: width * 0.6,
            imageUrl: brandImg,
            logoName: brandName,
            available: itemAvailable,
            onTap: onTap,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                imageUrl.map((image) => ShowCaseImage(image: image)).toList(),
          ),
        ],
      ),
    );
  }
}

class ShowCaseImage extends StatelessWidget {
  const ShowCaseImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    return AppRoundedImage(
      imageUrl: image,
      height: height * 0.1,
      width: width * 0.24,
      padding: const EdgeInsets.all(AppSizes.md),
      fit: BoxFit.cover,
      backgroundColor: dark ? AppColor.darkGrey : AppColor.light,
    );
  }
}
