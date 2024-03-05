import 'package:e_commerce_app/common/widgets/appbar/Custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/appbar/custom_tab_bar.dart';

import 'package:e_commerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce_app/features/shop/brand/brand.dart';
import 'package:e_commerce_app/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_app/features/shop/screens/store/widgets/catagory_tab.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';

import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/search_bar/app_search_bar.dart';
import '../../../../common/widgets/text/section_heading/section_heading.dart';

import '../../../../utils/constants/text_string.dart';
import '../../../../utils/device/device_utlities.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../cart/cart.dart';

class AppStore extends StatefulWidget {
  const AppStore({super.key});

  @override
  State<AppStore> createState() => _AppStoreState();
}

class _AppStoreState extends State<AppStore> {
  final TextEditingController storeSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final height = AppDeviceUtils.getScreenHeight();
    final categories = CategoryController.instance.featureCategory;
    //  final width = AppDeviceUtils.getScreenWidth();
    return DefaultTabController(
      length: categories.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            AppTexts.storeAppbarSubTitle,
            style: Theme.of(context).textTheme.headlineMedium!.apply(
                  color: dark ? AppColor.white : AppColor.black,
                ),
          ),
          actions: [
            IconButton(
              onPressed: () => Get.to(
                () => const CartScreen(),
              ),
              icon: Badge(
                backgroundColor: Colors.red,
                textColor: AppColor.white,
                label: const Text('2'),
                child: Icon(
                  Iconsax.shopping_bag,
                  color: dark ? AppColor.white : AppColor.dark,
                ),
              ),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: dark ? AppColor.black : AppColor.white,
                pinned: true,
                floating: true,
                expandedHeight: height * 0.47,
                flexibleSpace: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: AppSizes.spaceBtwSection,
                    ),
                    AppSearchBar(
                      showColor: true,
                      controller: storeSearchController,
                      hintText: 'Search in Store',
                      onChanged: (value) {
                        setState(() {});
                      },
                      iconChanged: () {
                        storeSearchController.clear();
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwSection,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.defaultSpace,
                      ),
                      child: AppSectionHeading(
                        text: 'Popular Brands',
                        anotherItem: TextButton(
                          onPressed: () => Get.to(
                            () => const BrandScreen(),
                          ),
                          child: const Text('View All'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwItem,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.defaultSpace,
                      ),
                      child: AppGridLayout(
                        height: height * 0.077,
                        itemCount: 4,
                        itemBuilder: (context, index) => AppBrandItemsCard(
                          imageUrl: AppImages.adidasLogo,
                          logoName: 'Adidas',
                          showBorder: true,
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                bottom: AppTabBar(
                  tabs: categories
                      .map(
                        (category) => Tab(
                          child: Text(category.name),
                        ),
                      )
                      .toList(),
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              AppCategoryTab(),
              AppCategoryTab(),
              AppCategoryTab(),
              AppCategoryTab(),
              AppCategoryTab(),
              AppCategoryTab(),
              AppCategoryTab(),
              AppCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
