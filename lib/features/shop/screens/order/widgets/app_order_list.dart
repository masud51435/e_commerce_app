import 'package:e_commerce_app/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class AppOrderList extends StatelessWidget {
  const AppOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return ListView.separated(
      itemCount: 11,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: AppSizes.spaceBtwItem,
      ),
      itemBuilder: (BuildContext context, int index) => AppRoundedContainer(
        showBorder: true,
        color: dark ? AppColor.dark : AppColor.light,
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: AppSizes.spaceBtwItem,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: AppColor.primaryColor,
                              fontSizeDelta: 1,
                            ),
                      ),
                      Text(
                        '13 Nov 2023',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.arrow_right_34),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwItem),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.tag),
                    const SizedBox(
                      width: AppSizes.spaceBtwItem,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('order',
                            style: Theme.of(context).textTheme.bodySmall),
                        Text(
                          'CW29D99',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Iconsax.calendar),
                    const SizedBox(
                      width: AppSizes.spaceBtwItem,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shipping Date',
                            style: Theme.of(context).textTheme.bodySmall),
                        Text(
                          '16 Nov 2023',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
