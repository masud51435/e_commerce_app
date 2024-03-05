import 'package:e_commerce_app/features/personalization/controllers/update_name_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../../common/widgets/commonbtn/commonbutton.dart';
import '../../../../utils/constants/text_string.dart';
import '../../../../utils/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(record());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Change Name',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppSizes.defaultSpace,
        ),
        child: Column(
          children: [
            Text(
              'Use real name for easy verification, This name will appear on several page',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSection,
            ),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstNameController,
                    validator: (value) => AppValidator.validateFirstName(value),
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outlined),
                      labelText: AppTexts.firstName,
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.lastNameController,
                    validator: (value) => AppValidator.validateLastName(value),
                    expands: false,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outlined),
                      labelText: AppTexts.lastName,
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSection,
                  ),
                  CommonBtn(
                    onPress: () => controller.updateUserName(),
                    title: 'Save',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
