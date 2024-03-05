import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/common/widgets/simmer/simmer_loader.dart';
import 'package:e_commerce_app/features/shop/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../common/widgets/app_banner_rounded_image/banner_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utlities.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AppHomeSlider extends StatelessWidget {
  const AppHomeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BannerController controller = Get.put(BannerController());
    final dark = AppHelperFunctions.isDarkMode(context);
    final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    return Obx(
      () {
        if (controller.bannerLoading.value) {
          return AppShimmerLoader(width: width, height: height * 0.2);
        }
        if (controller.allBanner.isEmpty) {
          return const Center(
            child: Text('No Data Found'),
          );
        } else {
          return Column(
            children: [
              CarouselSlider(
                items: controller.allBanner
                    .map(
                      (banner) => Center(
                        child: AppRoundedImage(
                          imageUrl: banner.imageUrl,
                          height: height * 0.2,
                          width: width,
                          fit: BoxFit.fill,
                          isNetworkImage: true,
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  initialPage: controller.currentPageIndex.value,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                  viewportFraction: 1,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              AnimatedSmoothIndicator(
                activeIndex: controller.currentPageIndex.value,
                count: controller.allBanner.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: dark ? AppColor.light : AppColor.dark,
                  dotHeight: AppSizes.xs,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
