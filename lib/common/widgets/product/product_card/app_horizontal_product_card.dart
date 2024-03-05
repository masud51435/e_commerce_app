import 'package:e_commerce_app/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utlities.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../app_banner_rounded_image/banner_rounded_image.dart';
import '../../icons/circularicon.dart';
import '../../icons/verified_brand_logo.dart';
import '../../text/product_price.dart';
import '../../text/product_title_text.dart';

class AppHorizontalProductCard extends StatelessWidget {
  const AppHorizontalProductCard({super.key});

  @override
  Widget build(BuildContext context) {
   // final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    final dark = AppHelperFunctions.isDarkMode(context);
    return AppRoundedContainer(
      width: width * 0.70,
     // height: height * 0.140,
      showBorder: true,
      color: dark ? AppColor.darkerGrey : AppColor.lightGrey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: AppRoundedContainer(
            //  height: height * 0.145,
              // width: width * 0.35,
              padding: const EdgeInsets.all(AppSizes.sm),
              color: dark ? AppColor.dark : AppColor.white,
              child: Stack(
                children: [
                  Center(
                    child: AppRoundedImage(
                      imageUrl: AppImages.productImage2,
                      fit: BoxFit.cover,
                      onPress: () {
                        // Get.to(() => const ProductDetail());
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: AppRoundedContainer(
                      radius: AppSizes.sm,
                      color: AppColor.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: AppColor.black,
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: AppCircularIcon(
                      icon: Icons.favorite_outline,
                      // color: Colors.white,
                      onPress: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSizes.sm),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.38,
                        child: const ProductTitleText(
                          text: 'Green Nike Air Shoes',
                        ),
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwItem / 4,
                      ),
                      const VerifiedBrandLogo(
                        brandName: 'Nike',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppSizes.sm,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Flexible(
                        child: AppProductPrice(
                          price: '20.5',
                          isLarge: true,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColor.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                AppSizes.cardRadiusMd,
                              ),
                              bottomRight: Radius.circular(
                                AppSizes.cardRadiusLg,
                              ),
                            ),
                          ),
                          child: const SizedBox(
                            height: AppSizes.iconLg + 1.2,
                            width: AppSizes.iconLg + 1.2,
                            child: Icon(
                              Icons.add,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
