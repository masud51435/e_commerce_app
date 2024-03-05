import 'package:e_commerce_app/features/authentication/controllers/signup_controller/signupcontrol.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/commonbtn/commonbutton.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
import 'signup_term_condition.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: controller.firstNameController,
                  validator: (value) => AppValidator.validateFirstName(value),
                  expands: false,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outlined),
                    labelText: AppTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(
                width: AppSizes.spaceBtwInputFields,
              ),
              Flexible(
                child: TextFormField(
                  controller: controller.lastNameController,
                  validator: (value) => AppValidator.validateLastName(value),
                  expands: false,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outlined),
                    labelText: AppTexts.lastName,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.userNameController,
            validator: (value) => AppValidator.validateUserName(value),
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: AppTexts.username,
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.emailController,
            validator: (value) => AppValidator.validateEmail(value),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: AppTexts.email,
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.phoneNumberController,
            validator: (value) => AppValidator.validatePhoneNumber(value),
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: AppTexts.phoneNo,
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          Obx(
            () => TextFormField(
              controller: controller.passwordController,
              validator: (value) => AppValidator.validatePassword(value),
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
            height: AppSizes.spaceBtwItem,
          ),
           const TermsCondition(),
          const SizedBox(
            height: AppSizes.spaceBtwItem,
          ),
          CommonBtn(
            onPress: () => controller.signUp(),
            title: AppTexts.signUp,
          ),
          const SizedBox(
            height: AppSizes.spaceBtwSection,
          ),
        ],
      ),
    );
  }
}
