import 'package:e_commerce_app/common/widgets/simmer/simmer_loader.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/device/device_utlities.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.intemCount = 8});
  final int intemCount;

  @override
  Widget build(BuildContext context) {
    final height = AppDeviceUtils.getScreenHeight();
    return SizedBox(
      height: height * 0.13,
      child: ListView.separated(
        itemCount: intemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: AppSizes.spaceBtwItem,
        ),
        itemBuilder: (BuildContext context, int index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppShimmerLoader(
                width: 60,
                height: 60,
                radius: 100,
              ),
              SizedBox(
                height: AppSizes.spaceBtwItem / 2,
              ),
              AppShimmerLoader(width: 60, height: 12),
            ],
          );
        },
      ),
    );
  }
}
