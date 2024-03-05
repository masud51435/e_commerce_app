import 'package:e_commerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/simmer/simmer_loader.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppVerticalShimmer extends StatelessWidget {
  const AppVerticalShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AppGridLayout(
      itemCount: itemCount,
      itemBuilder: (p0, p1) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppShimmerLoader(width: 180, height: 180),
            SizedBox(
              height: AppSizes.spaceBtwItem,
            ),
            AppShimmerLoader(width: 160, height: 15),
            SizedBox(
              height: AppSizes.spaceBtwItem / 2,
            ),
            AppShimmerLoader(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
