import 'package:e_commerce_app/common/widgets/commonbtn/commonbutton.dart';
import 'package:e_commerce_app/features/authentication/controllers/login_controller/logIn_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/forgot_password/forgetPassword.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../../../utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LogInController controller = Get.put(LogInController());
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: controller.emailController,
            validator: (value) => AppValidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: AppTexts.email,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: controller.passwordController,
              validator: (value) => AppValidator.validateLoginPassword(value),
              obscureText: controller.toggle.value,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: AppTexts.password,
                suffixIcon: InkWell(
                  onTap: () => controller.setToggle(),
                  child: Icon(
                    controller.toggle.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields / 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.rememberMeController.value,
                      onChanged: (value) =>
                          controller.setRememberMeController(),
                    ),
                  ),
                  const Text(AppTexts.rememberMe),
                ],
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const ForgetPassword());
                },
                child: const Text(AppTexts.forgetPassword),
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.defaultSpace,
          ),
          CommonBtn(
            onPress: () => controller.logIn(),
            title: AppTexts.login,
          ),
          const SizedBox(
            height: AppSizes.spaceBtwItem,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Get.to(() => const SignUpScreen());
              },
              child: const Text(AppTexts.createAccount),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwSection,
          ),
        ],
      ),
    );
  }
}
