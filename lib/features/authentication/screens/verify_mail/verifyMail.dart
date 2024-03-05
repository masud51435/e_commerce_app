import 'package:e_commerce_app/common/widgets/commonbtn/commonbutton.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repo.dart';
import 'package:e_commerce_app/features/authentication/controllers/signup_controller/verify_email_controller.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_string.dart';
import 'package:e_commerce_app/utils/device/device_utlities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VerifyMail extends StatelessWidget {
  const VerifyMail({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logOut(),
            icon: const Icon(Icons.clear),
          ),
          const SizedBox(
            width: AppSizes.defaultSpace,
          ),
        ],
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
                SvgPicture.asset(
                  AppImages.mailverify,
                  semanticsLabel: 'Mail Verification',
                  height: height * 0.25,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSection,
                ),
                Text(
                  AppTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItem,
                ),
                Text(
                  email ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItem,
                ),
                Text(
                  AppTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSection,
                ),
                CommonBtn(
                  onPress: () {
                    controller.checkEmailVerificationStatus();
                  },
                  title: AppTexts.appContinue,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItem,
                ),
                SizedBox(
                  width: width,
                  child: OutlinedButton(
                    onPressed: () {
                      controller.sendEmailVerification();
                    },
                    child: const Text(
                      AppTexts.resendEmail,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
