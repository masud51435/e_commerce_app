import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/appbar/Custom_appbar.dart';

import '../../../common/widgets/product/app_sortable_product/app_sort_able_product.dart';

class AllProductScreen extends StatelessWidget {
  AllProductScreen({super.key});

  final List<String> list = <String>[
    'High Price',
    'Low Price',
    'Sale',
    'Newest',
    'Popularity'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Sports Shoes',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: AppSortableProduct(list: list),
        ),
      ),
    );
  }
}
