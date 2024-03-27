import 'package:e_commerce_app/common/widgets/product/product_card/app_vertical_product_card.dart';
import 'package:e_commerce_app/common/widgets/search_bar/app_search_bar.dart';
import 'package:e_commerce_app/common/widgets/simmer/app_vertical_shimmer.dart';
import 'package:e_commerce_app/features/shop/all_product/all_product.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller%20.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shape/container/primary_header_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/text/section_heading/section_heading.dart';
import 'widgets/appbar_vertical_imagelist.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_promo_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final height = AppDeviceUtils.getScreenHeight();
    //final width = AppDeviceUtils.getScreenWidth();
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header part of the apps //
            AppPrimaryHeader(
              child: Column(
                children: [
                  const homeAppBar(),
                  const SizedBox(
                    height: AppSizes.spaceBtwSection,
                  ),
                  AppSearchBar(
                    controller: searchController,
                    hintText: 'Search in Store',
                    onChanged: (value) {
                      setState(() {});
                    },
                    iconChanged: () {
                      searchController.clear();
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSection,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: AppSizes.defaultSpace,
                      bottom: AppSizes.spaceBtwItem,
                    ),
                    child: Column(
                      children: [
                        AppSectionHeading(
                          text: 'Popular Category',
                          textColor: AppColor.white,
                        ),
                        SizedBox(
                          height: AppSizes.spaceBtwItem,
                        ),
                        appbarVerticalImageList(),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Body part of the apps //
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.defaultSpace,
                vertical: AppSizes.xs,
              ),
              child: Column(
                children: [
                  const AppHomeSlider(),
                  const SizedBox(
                    height: AppSizes.defaultSpace,
                  ),
                  AppSectionHeading(
                    text: 'Popular Product',
                    anotherItem: TextButton(
                      onPressed: () => Get.to(
                        () => AllProductScreen(),
                      ),
                      child: const Text('View All'),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem / 2,
                  ),
                  Obx(
                    () {
                      if (controller.productLoading.value) {
                        return const AppVerticalShimmer();
                      }
                      if (controller.featureProducts.isEmpty) {
                        return Center(
                          child: Text(
                            'No data found',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      }
                      return AppGridLayout(
                        itemCount: controller.featureProducts.length,
                        itemBuilder: (BuildContext context, int index) =>
                            AppVerticalProductCard(
                          product: controller.featureProducts[index],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
