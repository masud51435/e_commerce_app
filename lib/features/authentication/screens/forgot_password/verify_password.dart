import 'package:e_commerce_app/features/authentication/controllers/forgot_pass_controller/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/commonbtn/commonbutton.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_string.dart';
import '../../../../utils/device/device_utlities.dart';
import '../login/login.dart';

class PasswordVerify extends StatelessWidget {
  const PasswordVerify({
    super.key,
    this.email,
  });
  final String? email;

  @override
  Widget build(BuildContext context) {
    //final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
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
                const Image(
                  image: AssetImage(AppImages.deliveredEmailIllustration),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSection,
                ),
                Text(
                  AppTexts.changeYourPasswordTitle,
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
                  AppTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSection,
                ),
                CommonBtn(
                  onPress: () {
                    Get.offAll(
                      () => const LoginScreen(),
                    );
                  },
                  title: AppTexts.done,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItem,
                ),
                SizedBox(
                  width: width,
                  child: OutlinedButton(
                    onPressed: () =>
                        ForgetPasswordController.instance.reSendMail(),
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
