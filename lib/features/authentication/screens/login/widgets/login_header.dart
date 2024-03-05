import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.lg,
          ),
          child: Image(
            height: Get.height * 0.16,
            fit: BoxFit.cover,
            image: const AssetImage(
              AppImages.lightAppLogo,
            ),
          ),
        ),
        const SizedBox(
          height: AppSizes.lg,
        ),
        Text(
          AppTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: AppSizes.sm,
        ),
        Text(
          AppTexts.loginSubTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
