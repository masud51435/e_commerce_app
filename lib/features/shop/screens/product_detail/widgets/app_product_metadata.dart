import 'package:e_commerce_app/common/widgets/icons/verified_brand_logo.dart';
import 'package:e_commerce_app/common/widgets/text/product_price.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/app_banner_rounded_image/banner_rounded_image.dart';

import '../../../../../common/widgets/custom_shape/container/rounded_container.dart';
import '../../../../../common/widgets/text/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utlities.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    // final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppRoundedContainer(
              radius: AppSizes.sm,
              color: AppColor.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm, vertical: AppSizes.xs),
              child: Text(
                '75%',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: AppColor.black,
                    ),
              ),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItem,
            ),
            const AppProductPrice(
              price: '150',
              lineThrough: true,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItem / 2,
            ),
            const AppProductPrice(
              price: '80',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 1.5,
        ),
        const ProductTitleText(
          smallSize: false,
          text: 'Green Nike Air Shoes',
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 1.5,
        ),
        Row(
          children: [
            const Text('Stock :'),
            const SizedBox(
              width: AppSizes.spaceBtwItem / 1.5,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 1.5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppRoundedImage(
              width: width * 0.07,
              applyImageRadius: false,
              imageUrl: AppImages.nikeLogo,
              color: dark ? AppColor.white : AppColor.black,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: AppSizes.iconXs,
            ),
            const VerifiedBrandLogo(
              brandName: 'Nike',
              doStyle: true,
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSection,
        ),
      ],
    );
  }
}
