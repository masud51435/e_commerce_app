import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_card/app_vertical_product_card.dart';

class AppSortableProduct extends StatelessWidget {
  const AppSortableProduct({
    super.key,
    required this.list,
  });

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
            hintText: 'Click Here',
            prefixIcon: Icon(Iconsax.sort),
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSizes.buttonElevation,
            ),
          ),
          onChanged: (value) {},
          iconSize: AppSizes.iconXl,
          items: list
              .map((String value) =>
                  DropdownMenuItem(value: value, child: Text(value)))
              .toList(),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSection,
        ),
        AppGridLayout(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) =>
              AppVerticalProductCard(
            product: ProductModel.empty(),
          ),
        ),
      ],
    );
  }
}
