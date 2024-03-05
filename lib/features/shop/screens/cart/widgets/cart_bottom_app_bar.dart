import 'package:e_commerce_app/common/widgets/text/product_price.dart';
import 'package:e_commerce_app/features/shop/screens/checkOut/check_out.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CartBottomAppBar extends StatelessWidget {
  const CartBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace,
        vertical: AppSizes.defaultSpace / 3,
      ),
      decoration: BoxDecoration(
        color: dark ? AppColor.darkerGrey : AppColor.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.cardRadiusLg),
          topRight: Radius.circular(AppSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppProductPrice(
            price: '240',
            isLarge: true,
          ),
          ElevatedButton(
            onPressed: () => Get.to(() => const CheckOutScreen()),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(AppSizes.md),
              backgroundColor: AppColor.primaryColor,
              side: const BorderSide(color: AppColor.primaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.cardRadiusXs),
              ),
            ),
            child: const Text('Check Out'),
          ),
        ],
      ),
    );
  }
}
