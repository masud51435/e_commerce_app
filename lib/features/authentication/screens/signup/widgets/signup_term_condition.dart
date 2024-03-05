import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup_controller/signupcontrol.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = AppHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 24,
            width: 24,
            child: Obx(
              () => Checkbox(
                value: controller.privacyController.value,
                onChanged: (value) => controller.setPrivacyController(),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: AppSizes.sm,
        ),
        Expanded(
          flex: 11,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${AppTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: '${AppTexts.privacyPolicy} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? AppColor.white : AppColor.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                ),
                TextSpan(
                  text: '${AppTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: '${AppTexts.termsOfUse} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? AppColor.white : AppColor.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ],
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
