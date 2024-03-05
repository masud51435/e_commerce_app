import 'package:e_commerce_app/common/widgets/text/section_heading/section_heading.dart';
import 'package:e_commerce_app/features/shop/brand/all_brand_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../common/widgets/brands/brand_card.dart';
import '../../../common/widgets/layout/grid_layout.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utlities.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppDeviceUtils.getScreenHeight();
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Brands',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.defaultSpace,
          ),
          child: Column(
            children: [
              const AppSectionHeading(text: 'Brands'),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              AppGridLayout(
                height: height * 0.077,
                itemCount: 20,
                itemBuilder: (context, index) => AppBrandItemsCard(
                  showBorder: true,
                  onTap: () => Get.to(
                    () => BrandProduct(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
