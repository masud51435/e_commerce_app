import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../../../utils/device/device_utlities.dart';
import '../../../controllers/onBoarding_controller/onboarding_controller.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: AppSizes.defaultSpace,
      top: AppDeviceUtils.getAppBarHeight(),
      child: OutlinedButton(
        onPressed: () {
          return OnBoardingController.instance.skipPage();
        },
        child: const Text(
          AppTexts.skip,
        ),
      ),
    );
  }
}