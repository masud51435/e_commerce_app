import 'package:e_commerce_app/data/repositories/banner/banner_repository.dart';
import 'package:e_commerce_app/data/repositories/category/category_repository.dart';
import 'package:e_commerce_app/data/repositories/product/product_repository.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/dummy_data/dummy_data_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../common/widgets/text/section_heading/section_heading.dart';
import '../../../features/personalization/screens/settings/widgets/SettingMenuTile.dart';
import '../../../utils/constants/image_string.dart';
import '../../../utils/popup/full_screen_loader.dart';

class UploadAllData extends StatelessWidget {
  const UploadAllData({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryRepository());
    final bannerController = Get.put(BannerRepository());
    final productController = Get.put(ProductRepository());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Upload Data',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const AppSectionHeading(
                text: 'Account Setting',
              ),
              const SizedBox(height: AppSizes.spaceBtwItem),
              SettingMenuTile(
                icon: Iconsax.bank,
                title: 'Upload Categories',
                subTitle: 'All data will upload in FireStore',
                trailing: Obx(
                  () {
                    if (controller.categoryLoading.value) {
                      //start loading
                      AppFullScreenLoader.openLoadingDialog(
                        'Loading to upload data...',
                        AppImages.signUploading,
                      );
                    }
                    return InkWell(
                      onTap: () {
                        controller.uploadDummyData(AppDummyData.categories);
                      },
                      child: const Icon(Iconsax.add_circle4),
                    );
                  },
                ),
              ),
              SettingMenuTile(
                icon: Iconsax.activity,
                title: 'Upload Banners',
                subTitle: 'All data will upload in FireStore',
                trailing: InkWell(
                  onTap: () =>
                      bannerController.uploadBannerData(AppDummyData.banners),
                  child: const Icon(Iconsax.add_circle4),
                ),
              ),
              SettingMenuTile(
                icon: Iconsax.forward_item,
                title: 'Upload Products',
                subTitle: 'All data will upload in FireStore',
                trailing: InkWell(
                  onTap: () => productController
                      .uploadProductDummyData(AppDummyData.products),
                  child: const Icon(Iconsax.add_circle4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
