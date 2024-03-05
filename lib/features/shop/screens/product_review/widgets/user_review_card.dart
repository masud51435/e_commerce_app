import 'package:e_commerce_app/common/widgets/readmore/app_readmore_text.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/app_banner_rounded_image/banner_rounded_image.dart';
import '../../../../../common/widgets/custom_shape/container/rounded_container.dart';
import '../../../../../common/widgets/product/rating/app_product_rating_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/device/device_utlities.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    // final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const AppRoundedImage(
            fit: BoxFit.cover,
            imageUrl: AppImages.userProfileImage1,
            height: 40,
            width: 40,
            applyImageRadius: true,
            borderRadius: 100,
          ),
          title: Text(
            'John Smith',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 1.5,
        ),
        const AppProductRatingIndicator(
          rating: 4.3,
          reviews: '10-Nov-2023',
          size: 20,
          doStyle: true,
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 1.5,
        ),
        const AppReadMoreText(
          text:
              'The user interface of the app is quite intuitive, I was able to navigate and make purchase seamlessly, Great job !',
          moreStyle: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w600,
          ),
          lessStyle: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 1.5,
        ),
        AppRoundedContainer(
          width: width,
          color: dark ? AppColor.darkerGrey : AppColor.grey,
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'App Store',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Text('10-Feb-2023'),
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItem / 1.5,
              ),
              const AppReadMoreText(
                moreStyle: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                lessStyle: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSection,
        ),
      ],
    );
  }
}
