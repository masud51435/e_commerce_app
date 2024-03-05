import 'package:e_commerce_app/common/widgets/icons/circularicon.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../../../../../utils/helpers/helper_functions.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.defaultSpace,
          vertical: AppSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? AppColor.darkGrey : AppColor.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.cardRadiusLg),
          topRight: Radius.circular(AppSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppCircularIcon(
                onPress: () {},
                icon: Iconsax.minus,
                backgroundColor: dark ? AppColor.light : AppColor.darkGrey,
                height: 40,
                width: 40,
                color: dark ? AppColor.black : AppColor.white,
              ),
              const SizedBox(width: AppSizes.spaceBtwItem),
              Text(
                '1',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(width: AppSizes.spaceBtwItem),
              AppCircularIcon(
                onPress: () {},
                icon: Iconsax.add4,
                backgroundColor: AppColor.black,
                height: 40,
                width: 40,
                color: AppColor.white,
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.shopping_bag),
            label: const Text('Add to Bag'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(AppSizes.md),
              backgroundColor: AppColor.black,
              side: const BorderSide(color: AppColor.black),
            ),
          ),
        ],
      ),
    );
  }
}
