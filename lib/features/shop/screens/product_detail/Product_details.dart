import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/screens/product_detail/widgets/app_product_metadata.dart';
import 'package:e_commerce_app/features/shop/screens/product_detail/widgets/product_bottom_appBar.dart';
import 'package:e_commerce_app/features/shop/screens/product_review/Product_review.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/commonbtn/commonbutton.dart';
import '../../../../common/widgets/readmore/app_readmore_text.dart';
import '../../../../common/widgets/text/section_heading/section_heading.dart';

import '../checkOut/check_out.dart';
import 'widgets/app_product_image_slide.dart';
import 'widgets/product_attibrute.dart';
import 'widgets/product_rating_share.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            AppProductImageSlide(
              product: product,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.defaultSpace,
                right: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductRatingAndShare(),
                  const ProductMetaData(),
                  const ProductAttribute(),
                  CommonBtn(
                      onPress: () => Get.to(
                            () => const CheckOutScreen(),
                          ),
                      title: 'CheckOut'),
                  const SizedBox(height: AppSizes.spaceBtwSection),
                  const AppSectionHeading(text: 'Description'),
                  const SizedBox(height: AppSizes.spaceBtwItem),
                  const AppReadMoreText(),
                  const SizedBox(height: AppSizes.spaceBtwItem),
                  const Divider(),
                  const SizedBox(height: AppSizes.spaceBtwItem),
                  AppSectionHeading(
                    text: 'Reviews (199)',
                    anotherItem: IconButton(
                      onPressed: () {
                        Get.to(() => const ProductReviewScreen());
                      },
                      icon: const Icon(
                        Iconsax.arrow_right_34,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ProductBottomBar(),
    );
  }
}
