import 'package:e_commerce_app/common/widgets/chip/ChoiceChip.dart';
import 'package:e_commerce_app/common/widgets/text/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/text/section_heading/section_heading.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shape/container/rounded_container.dart';
import '../../../../../common/widgets/text/product_price.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utlities.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final width = AppDeviceUtils.getScreenWidth();
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppRoundedContainer(
          width: width,
          color: dark ? AppColor.darkerGrey : AppColor.grey,
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            children: [
              Row(
                children: [
                  const AppSectionHeading(text: 'Variation :'),
                  const SizedBox(
                    width: AppSizes.spaceBtwItem,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text('Price :  '),
                          AppProductPrice(
                            price: '90',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Stock :  '),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItem / 1.5,
              ),
              const ProductTitleText(
                text:
                    'This is the description of the product and it can go upto max 4 lines',
                maxLine: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!
              .map(
                (attribute) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSectionHeading(text: attribute.name ?? ''),
                    const SizedBox(
                      height: AppSizes.spaceBtwItem / 1.5,
                    ),
                    Wrap(
                      spacing: AppSizes.sm,
                      children: attribute.values!
                          .map(
                            (value) => AppChoiceChip(
                              text: value,
                              selected: false,
                              onSelected: (value) {},
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
        const SizedBox(height: AppSizes.spaceBtwSection),
      ],
    );
  }
}
