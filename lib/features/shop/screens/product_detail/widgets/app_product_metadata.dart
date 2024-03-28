import 'package:e_commerce_app/common/widgets/icons/verified_brand_logo.dart';
import 'package:e_commerce_app/common/widgets/text/product_price.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller%20.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/app_banner_rounded_image/banner_rounded_image.dart';

import '../../../../../common/widgets/custom_shape/container/rounded_container.dart';
import '../../../../../common/widgets/text/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utlities.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    // final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    final controller = ProductController.instance;
    final percentage =
        controller.calculateSaleParentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppRoundedContainer(
              radius: AppSizes.sm,
              color: AppColor.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm, vertical: AppSizes.xs),
              child: Text(
                '$percentage%',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: AppColor.black,
                    ),
              ),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItem,
            ),
            Flexible(
              child: Row(
                children: [
                  if (product.productType == ProductType.single.toString() &&
                      product.salePrice > 0)
                    Padding(
                      padding: const EdgeInsets.only(right: AppSizes.sm),
                      child: Text(
                        product.price.toString(),
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                              decoration: TextDecoration.lineThrough,
                            ),
                      ),
                    ),
                  AppProductPrice(
                    price: controller.getProductPrice(product),
                    isLarge: true,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 1.5,
        ),
        ProductTitleText(
          smallSize: false,
          text: product.title.toString(),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 1.5,
        ),
        Row(
          children: [
            const Text('Stock :'),
            const SizedBox(
              width: AppSizes.spaceBtwItem / 1.5,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 1.5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppRoundedImage(
              width: width * 0.07,
              applyImageRadius: false,
              imageUrl: product.brand!.image,
              color: dark ? AppColor.white : AppColor.black,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: AppSizes.iconXs,
            ),
            VerifiedBrandLogo(
              brandName: product.brand != null ? product.brand!.name : '',
              doStyle: true,
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSection,
        ),
      ],
    );
  }
}
