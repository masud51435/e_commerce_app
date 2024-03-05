import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utlities.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/onBoarding_controller/onboarding_controller.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final OnBoardingController controller = Get.find();
    return Positioned(
      bottom: AppDeviceUtils.getBottomNavbarHeight(),
      right: AppSizes.defaultSpace,
      left: AppSizes.defaultSpace,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: controller.pageController,
            onDotClicked: controller.dotNavigationClick,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: dark ? AppColor.light : AppColor.dark,
              dotHeight: AppSizes.sm,
            ),
          ),
          ElevatedButton(
            onPressed: () => controller.nextPage(),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? AppColor.primaryColor : AppColor.black,
            ),
            child: const Icon(Iconsax.arrow_right_3),
          ),
        ],
      ),
    );
  }
}
