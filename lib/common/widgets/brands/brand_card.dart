import 'package:flutter/material.dart';

import '../app_banner_rounded_image/banner_rounded_image.dart';
import '../custom_shape/container/rounded_container.dart';
import '../icons/verified_brand_logo.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_string.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppBrandItemsCard extends StatelessWidget {
  const AppBrandItemsCard({
    super.key,
    this.heights = 70,
    this.widths = 150,
    required this.showBorder,
    this.logoName = 'Nike',
    this.available = "36 Product Available",
    this.imageUrl = AppImages.nikeLogo,
    this.onTap,
    this.showAvailable = true,
    this.imgFlex = 5,
    this.textFlex = 9,
  });

  final double heights, widths;
  final bool showBorder, showAvailable;
  final String logoName, available, imageUrl;
  final void Function()? onTap;
  final int imgFlex, textFlex;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    // final height = AppDeviceUtils.getScreenHeight();
    // final width = AppDeviceUtils.getScreenWidth();
    return InkWell(
      onTap: onTap,
      child: AppRoundedContainer(
        height: heights,
        width: widths,
        padding: const EdgeInsets.all(AppSizes.sm),
        showBorder: showBorder,
        color: dark ? AppColor.dark : AppColor.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: imgFlex,
              child: AppRoundedImage(
                // height: height * 0.15,
                //width: width * 0.13,
                applyImageRadius: false,
                imageUrl: imageUrl,
                color: dark ? AppColor.white : AppColor.black,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: AppSizes.sm,
            ),
            Expanded(
              flex: textFlex,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerifiedBrandLogo(
                    brandName: logoName,
                    doStyle: true,
                    textStyle: Theme.of(context).textTheme.titleLarge,
                  ),
                  showAvailable
                      ? Text(
                          available,
                          style: Theme.of(context).textTheme.labelMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
