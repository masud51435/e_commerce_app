import 'package:e_commerce_app/common/widgets/appbar/Custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/simmer/simmer_loader.dart';
import 'package:e_commerce_app/common/widgets/text/section_heading/section_heading.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/change_name_screen.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/app_banner_rounded_image/banner_rounded_image.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/device/device_utlities.dart';
import '../../controllers/user_data_controller.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = AppDeviceUtils.getScreenWidth();
    final controller = UserController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(AppTexts.profile,
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Obx(
                      () {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : AppImages.user;
                        return controller.imageUploading.value
                            ? const AppShimmerLoader(
                                width: 80,
                                height: 80,
                                radius: 100,
                              )
                            : AppRoundedImage(
                                isNetworkImage: networkImage.isNotEmpty,
                                imageUrl: image,
                                height: 80,
                                width: 80,
                                applyImageRadius: true,
                                borderRadius: 100,
                                fit: BoxFit.cover,
                                padding: const EdgeInsets.all(AppSizes.xs),
                              );
                      },
                    ),
                    TextButton(
                      onPressed: () => controller.uploadProfileImage(),
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItem / 2,
              ),
              const Divider(),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              const AppSectionHeading(text: 'Profile Information'),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              AppProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onTap: () => Get.to(
                  () => const ChangeNameScreen(),
                ),
              ),
              AppProfileMenu(
                title: 'Email',
                value: controller.user.value.email,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItem / 2,
              ),
              const Divider(),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              const AppSectionHeading(text: 'Additional Information'),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              AppProfileMenu(
                title: 'UserId',
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              AppProfileMenu(
                title: 'Phone No',
                value: controller.user.value.phoneNumber,
              ),
              const AppProfileMenu(
                title: 'Gender',
                value: 'Male',
              ),
              const AppProfileMenu(
                title: 'Birth Date',
                value: '14 Feb, 2000',
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              SizedBox(
                width: width,
                child: OutlinedButton(
                  onPressed: () => controller.deleteAccountPopUp(),
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
