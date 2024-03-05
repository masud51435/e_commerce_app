import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../commonbtn/commonbutton.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_string.dart';

class AccountSuccess extends StatelessWidget {
  const AccountSuccess({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onpress,
  });

  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
              AppSizes.defaultSpace,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(image, width: Get.width * 0.6),
                const SizedBox(
                  height: AppSizes.spaceBtwSection,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItem,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSection,
                ),
                CommonBtn(
                  onPress: onpress,
                  title: AppTexts.confirm,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItem,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
