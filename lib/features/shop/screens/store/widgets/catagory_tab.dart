import 'package:e_commerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/text/section_heading/section_heading.dart';
import 'package:e_commerce_app/features/shop/all_product/all_product.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller%20.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/brands/app_brand_showCase.dart';
import '../../../../../common/widgets/product/product_card/app_vertical_product_card.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/sizes.dart';

//import '../../../../../utils/device/device_utlities.dart';

class AppCategoryTab extends StatelessWidget {
  const AppCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = AppDeviceUtils.getScreenHeight();
    final controller = ProductController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(
            AppSizes.defaultSpace,
          ),
          child: Column(
            children: [
              const AppBrandShowCase(
                imageUrl: [
                  AppImages.productImage20,
                  AppImages.productImage21,
                  AppImages.productImage22,
                ],
              ),
              const AppBrandShowCase(
                brandImg: AppImages.adidasLogo,
                brandName: 'Adidas',
                itemAvailable: '150 Product Available',
                imageUrl: [
                  AppImages.productImage20,
                  AppImages.productImage21,
                  AppImages.productImage22,
                ],
              ),
              AppSectionHeading(
                text: 'You Might Like',
                // darkOn: true,
                anotherItem: TextButton(
                  onPressed: () => Get.to(
                    () => AllProductScreen(),
                  ),
                  child: const Text('View All'),
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              AppGridLayout(
                //  height: height * 0.33,
                itemCount: controller.featureProducts.length,
                itemBuilder: (BuildContext context, int index) =>
                    AppVerticalProductCard(
                  product: controller.featureProducts[index],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
