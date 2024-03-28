import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

//variable
  RxString selectProductImage = ''.obs;

  // Get all images from product and variation
  List<String> getAllProductImage(ProductModel product) {
    //use set to get unique image only
    Set<String> images = {};

    // load thumbnail image
    images.add(product.thumbnail);

    //assign Thumbnail as selected image
    selectProductImage.value = product.thumbnail;

    //get all image from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    //get all image from the product variation if not null
    // if (product.productVariations != null ||
    //     product.productVariations!.isNotEmpty) {
    //   images.addAll(
    //     product.productVariations!.map((variation) => variation.image),
    //   );
    // }
    return images.toList();
  }

  // show image popup
  void shownLargeImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.defaultSpace * 2,
                horizontal: AppSizes.defaultSpace,
              ),
              child: CachedNetworkImage(
                imageUrl: image,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSection,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Close'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
