import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_shape/container/rounded_container.dart';
import '../../../../../common/widgets/text/product_price.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

import 'add_remove_button.dart';
import 'app_cart_item.dart';
import 'cartImage.dart';

class ProductOrderItem extends StatelessWidget {
  const ProductOrderItem({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    // final dark = AppHelperFunctions.isDarkMode(context);
    // final height = AppDeviceUtils.getScreenHeight();
    // final width = AppDeviceUtils.getScreenWidth();
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) => AppRoundedContainer(
        showBorder: showAddRemoveButton ? true : false,
        padding: showAddRemoveButton
            ? const EdgeInsets.all(AppSizes.sm)
            : const EdgeInsets.all(0),
        margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItem),
        color: AppColor.transparent,
        child: Column(
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: CartImage(),
                ),
                SizedBox(
                  width: AppSizes.sm,
                ),
                Expanded(
                  flex: 11,
                  child: AppCartItem(),
                ),
              ],
            ),
            if (showAddRemoveButton)
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
            if (showAddRemoveButton)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AddRemoveButton(),
                  AppProductPrice(
                    price: '80',
                    isLarge: true,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
