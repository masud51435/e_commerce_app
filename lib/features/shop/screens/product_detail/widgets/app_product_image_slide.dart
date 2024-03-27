import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/features/shop/controllers/product/images_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/app_banner_rounded_image/banner_rounded_image.dart';
import '../../../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../../../common/widgets/custom_shape/curver_widge/curved_widget.dart';
import '../../../../../common/widgets/icons/circularicon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utlities.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class AppProductImageSlide extends StatelessWidget {
  const AppProductImageSlide({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImage(product);
    return AppCurvedWidget(
      child: Container(
        width: width,
        color: dark ? AppColor.darkerGrey : AppColor.light,
        child: Stack(
          children: [
            SizedBox(
              height: height * 0.42,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.defaultSpace * 2),
                  child: Obx(
                    () {
                      final image = controller.selectProductImage.value;
                      return InkWell(
                        onTap: () => controller.shownLargeImage(image),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (context, url, progress) =>
                              CircularProgressIndicator(
                            value: progress.progress,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            CustomAppBar(
              showBackArrow: true,
              actions: [
                AppCircularIcon(
                  icon: Icons.favorite,
                  color: Colors.red,
                  onPress: () {},
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: AppSizes.spaceBtwSection,
              left: AppSizes.defaultSpace,
              child: SizedBox(
                height: height * 0.08,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: AppSizes.spaceBtwItem,
                  ),
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) => Obx(
                    () {
                      final imageSelected =
                          controller.selectProductImage.value == images[index];
                      return AppRoundedImage(
                        onPress: () =>
                            controller.selectProductImage.value =
                            images[index],
                        width: width * 0.19,
                        border: Border.all(
                          color: imageSelected
                              ? AppColor.primaryColor
                              : AppColor.transparent,
                        ),
                        backgroundColor: dark ? AppColor.dark : AppColor.white,
                        padding: const EdgeInsets.all(AppSizes.sm),
                        fit: BoxFit.cover,
                        isNetworkImage: true,
                        imageUrl: images[index],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
