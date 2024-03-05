import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';

class AppFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (BuildContext context) => PopScope(
        canPop: false,
        child: Container(
          color: Get.isDarkMode ? AppColor.dark : AppColor.white,
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.25),
              AppAnimationLoaderWidget(
                text: text,
                animation: animation,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static offLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
