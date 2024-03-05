import 'package:e_commerce_app/common/widgets/product/product_card/app_horizontal_product_card.dart';
import 'package:e_commerce_app/common/widgets/text/section_heading/section_heading.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_banner_rounded_image/banner_rounded_image.dart';
import '../../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../../utils/device/device_utlities.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = AppHelperFunctions.isDarkMode(context);
    final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Sports',
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
              AppRoundedImage(
                imageUrl: AppImages.promoBanner1,
                width: width,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSection,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSectionHeading(
                    text: 'Sports Shoes',
                    anotherItem: TextButton(
                      onPressed: () {},
                      child: const Text('View All'),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem / 2,
                  ),
                  SizedBox(
                    // width: width * 0.78,
                    height: height * 0.140,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: AppSizes.spaceBtwItem,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          const AppHorizontalProductCard(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSection,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSectionHeading(
                    text: 'Sports Equipments',
                    anotherItem: TextButton(
                      onPressed: () {},
                      child: const Text('View All'),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem / 2,
                  ),
                  SizedBox(
                    // width: width * 0.78,
                    height: height * 0.140,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: AppSizes.spaceBtwItem,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          const AppHorizontalProductCard(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSection,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSectionHeading(
                    text: 'Track Suits',
                    anotherItem: TextButton(
                      onPressed: () {},
                      child: const Text('View All'),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem / 2,
                  ),
                  SizedBox(
                    // width: width * 0.78,
                    height: height * 0.140,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: AppSizes.spaceBtwItem,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          const AppHorizontalProductCard(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
