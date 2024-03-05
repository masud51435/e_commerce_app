import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../common/widgets/product/app_sortable_product/app_sort_able_product.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utlities.dart';

class BrandProduct extends StatelessWidget {
  BrandProduct({super.key});

  final List<String> list = <String>[
    'High Price',
    'Low Price',
    'Sale',
    'Newest',
    'Popularity'
  ];

  @override
  Widget build(BuildContext context) {
    final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Nike',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               AppBrandItemsCard(
                showBorder: true,
                widths: width,
                heights: height * 0.077,
                imgFlex: 2,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSection,
              ),
              AppSortableProduct(list: list),
            ],
          ),
        ),
      ),
    );
  }
}
