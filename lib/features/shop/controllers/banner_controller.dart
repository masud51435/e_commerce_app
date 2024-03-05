import 'package:e_commerce_app/data/repositories/banner/banner_repository.dart';
import 'package:e_commerce_app/features/shop/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();
  final _bannerRepository = Get.put(BannerRepository());

  RxBool bannerLoading = false.obs;
  RxList<BannerModel> allBanner = <BannerModel>[].obs;

  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  @override
  void onInit() {
    fetchBanner();
    super.onInit();
  }

  Future<void> fetchBanner() async {
    try {
      // Show loader while loading Categories
      bannerLoading.value = true;

      //fetch banner from firebaseFireStore
      final banners = await _bannerRepository.getAllBanner();

      // assign all data into allBanner
      allBanner.assignAll(banners);
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    } finally {
      bannerLoading.value = false;
    }
  }
}
