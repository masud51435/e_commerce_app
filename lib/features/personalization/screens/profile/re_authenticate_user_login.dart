import 'package:e_commerce_app/common/widgets/commonbtn/commonbutton.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_data_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/text_string.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.verifyEmail,
                  validator: (value) => AppValidator.validateEmail(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: AppTexts.email,
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        AppValidator.validateLoginPassword(value),
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
                const SizedBox(
                  height: AppSizes.spaceBtwSection,
                ),
                CommonBtn(
                  onPress: () => controller.reAuthEmailPassword(),
                  title: 'Authenticate',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
