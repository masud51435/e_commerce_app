import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/device/device_utlities.dart';

class CommonBtn extends StatelessWidget {
  const CommonBtn({
    super.key,
    required this.onPress,
    required this.title,
    this.loading = false,
  });
  final VoidCallback onPress;
  final String title;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final width = AppDeviceUtils.getScreenWidth();
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        child: loading
            ? Center(
                child: SizedBox(
                  height: Get.height * 0.027,
                  width: Get.width * 0.055,
                  child: const CircularProgressIndicator(
                    color: AppColor.white,
                    strokeWidth: 3,
                  ),
                ),
              )
            : Text(title),
      ),
    );
  }
}
