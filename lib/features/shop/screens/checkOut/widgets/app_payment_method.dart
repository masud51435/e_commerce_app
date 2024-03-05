import 'package:e_commerce_app/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/text/section_heading/section_heading.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class AppPaymentMethod extends StatelessWidget {
  const AppPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeading(
          text: 'Payment Method',
          anotherItem: TextButton(
            onPressed: () {},
            child: const Text('Change'),
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItem / 2),
        Row(
          children: [
            AppRoundedContainer(
              width: 60,
              height: 35,
              color: dark ? AppColor.light : AppColor.white,
              padding: const EdgeInsets.all(AppSizes.sm),
              child: const Image(
                fit: BoxFit.contain,
                image: AssetImage(
                  AppImages.paypal,
                ),
              ),
            ),
            const SizedBox(
              width: AppSizes.sm,
            ),
            Text(
              'PayPal',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ],
    );
  }
}
