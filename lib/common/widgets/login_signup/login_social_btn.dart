import 'package:e_commerce_app/features/authentication/controllers/login_controller/logIn_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_string.dart';
import '../../../utils/constants/sizes.dart';

class LoginSocialButton extends StatelessWidget {
  const LoginSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LogInController controller = Get.put(LogInController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(AppSizes.md),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onPressed: () => controller.googleSignIn(),
          child: Image.asset(
            AppImages.google,
            height: AppSizes.iconLg,
            width: AppSizes.iconLg,
          ),
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItem,
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(AppSizes.md),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onPressed: () {},
          child: Image.asset(
            AppImages.facebook,
            height: AppSizes.iconLg,
            width: AppSizes.iconLg,
          ),
        ),
      ],
    );
  }
}
