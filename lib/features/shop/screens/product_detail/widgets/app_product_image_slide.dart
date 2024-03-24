import 'package:flutter/material.dart';

import '../../../../../common/widgets/app_banner_rounded_image/banner_rounded_image.dart';
import '../../../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../../../common/widgets/custom_shape/curver_widge/curved_widget.dart';
import '../../../../../common/widgets/icons/circularicon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utlities.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class AppProductImageSlide extends StatelessWidget {
  const AppProductImageSlide({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    final dark = AppHelperFunctions.isDarkMode(context);
    return AppCurvedWidget(
      child: Container(
        width: width,
        color: dark ? AppColor.darkerGrey : AppColor.light,
        child: Stack(
          children: [
            SizedBox(
              height: height * 0.42,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.defaultSpace * 2),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppImages.productImage1,
                    ),
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
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) =>
                      AppRoundedImage(
                    onPress: () {},
                    width: width * 0.19,
                    border: Border.all(color: AppColor.primaryColor),
                    backgroundColor: dark ? AppColor.dark : AppColor.white,
                    padding: const EdgeInsets.all(AppSizes.sm),
                    fit: BoxFit.cover,
                    imageUrl: AppImages.productImage1,
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
