import 'package:e_commerce_app/common/widgets/app_banner_rounded_image/banner_rounded_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppVerticalImageText extends StatelessWidget {
  const AppVerticalImageText({
    super.key,
    this.ontap,
    required this.image,
    required this.title,
    this.height = 60,
    this.width = 60,
    this.radius = 100,
    this.isNullable = false,
    this.isNetworkImg = true,
  });

  final VoidCallback? ontap;

  final String image, title;
  final double height, width, radius;
  final bool isNullable, isNetworkImg;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right: AppSizes.spaceBtwItem),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppRoundedImage(
              height: height,
              width: width,
              imageUrl: image,
              fit: BoxFit.cover,
              borderRadius: radius,
              padding: const EdgeInsets.all(AppSizes.sm),
              isNetworkImage: isNetworkImg,
              backgroundColor: isNullable
                  ? (dark ? AppColor.black : AppColor.white)
                  : AppColor.white,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItem / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: isNullable
                          ? (dark ? AppColor.light : AppColor.dark)
                          : AppColor.white,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
