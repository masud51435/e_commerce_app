import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AppAnimationLoaderWidget extends StatelessWidget {
  const AppAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showButton = false,
    this.activeText,
    this.onActonPressed,
  });

  final String text, animation;
  final bool showButton;
  final String? activeText;
  final VoidCallback? onActonPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            width: Get.width * 0.8,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: AppSizes.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          showButton
              ? SizedBox(
                  width: Get.width * 0.4,
                  child: OutlinedButton(
                    onPressed: onActonPressed,
                    child: Text(
                      activeText!,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: AppColor.light,
                          ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
