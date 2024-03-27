import 'package:e_commerce_app/common/widgets/app_banner_rounded_image/banner_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller%20.dart';

import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/screens/product_detail/Product_details.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/appShadow.dart';
import '../../icons/circularicon.dart';
import '../../icons/verified_brand_logo.dart';
import '../../text/product_price.dart';
import '../../text/product_title_text.dart';

class AppVerticalProductCard extends StatelessWidget {
  const AppVerticalProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSaleParentage(product.price, product.salePrice);
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: dark ? AppColor.darkerGrey : AppColor.white,
          boxShadow: [AppShadowStyle.verticalProductShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppRoundedContainer(
              height: 175,
              padding: const EdgeInsets.all(AppSizes.sm),
              color: dark ? AppColor.dark : AppColor.light,
              child: Stack(
                children: [
                  Center(
                    child: AppRoundedImage(
                      imageUrl: product.thumbnail,
                      fit: BoxFit.cover,
                      isNetworkImage: true,
                      onPress: () {
                        Get.to(() => ProductDetail(
                              product: product,
                            ));
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: AppRoundedContainer(
                      radius: AppSizes.sm,
                      color: AppColor.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        "$salePercentage%",
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: AppColor.black,
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: AppCircularIcon(
                      icon: Icons.favorite,
                      color: Colors.red,
                      onPress: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.sm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    text: product.title,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem / 2,
                  ),
                  VerifiedBrandLogo(
                    brandName: product.brand!.name,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.sm,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        if (product.productType ==
                                ProductType.single.toString() &&
                            product.salePrice > 0)
                          Padding(
                            padding: const EdgeInsets.only(right: AppSizes.sm),
                            child: Text(
                              product.price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
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
                  InkWell(
                    onTap: () {
                      if (kDebugMode) {
                        print('add');
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.dark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            AppSizes.cardRadiusMd,
                          ),
                          bottomRight: Radius.circular(
                            AppSizes.cardRadiusLg,
                          ),
                        ),
                      ),
                      child: const SizedBox(
                        height: AppSizes.iconLg + 1.2,
                        width: AppSizes.iconLg + 1.2,
                        child: Icon(
                          Icons.add,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
