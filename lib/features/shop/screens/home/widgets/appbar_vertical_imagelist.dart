import 'package:e_commerce_app/common/widgets/simmer/category_simmer.dart';
import 'package:e_commerce_app/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_app/features/shop/screens/sub_catagory/sub_catagory.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/vertical_image_text/vertical_images_text.dart';

import '../../../../../utils/device/device_utlities.dart';

class appbarVerticalImageList extends StatelessWidget {
  const appbarVerticalImageList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final height = AppDeviceUtils.getScreenHeight();
    return Obx(
      () {
        if (controller.categoryLoading.value) {
          return const CategoryShimmer();
        }
        if (controller.featureCategory.isEmpty) {
          return SizedBox(
            height: height * 0.10,
            child: Center(
              child: Text(
                'No Data',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: AppColor.white,
                    ),
              ),
            ),
          );
        }
        return SizedBox(
          height: height * 0.13,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: controller.featureCategory.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final category = controller.featureCategory[index];
              return AppVerticalImageText(
                isNetworkImg: true,
                image: category.image ,
                title: category.name,
                ontap: () => Get.to(
                  () => const SubCategoryScreen(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
