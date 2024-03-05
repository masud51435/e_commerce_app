import 'package:e_commerce_app/features/authentication/controllers/forgot_pass_controller/forget_password_controller.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/commonbtn/commonbutton.dart';
import '../../../../utils/validators/validation.dart';
import '../login/login.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
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
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    image: AssetImage(AppImages.forgotpass),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSection,
                  ),
                  Text(
                    AppTexts.forgetPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem,
                  ),
                  Text(
                    AppTexts.forgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSection,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    validator: (value) => AppValidator.validateEmail(value),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: AppTexts.email,
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSection,
                  ),
                  CommonBtn(
                    onPress: () => controller.sendMail(),
                    title: AppTexts.submit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
