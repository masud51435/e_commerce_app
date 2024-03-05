import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/app_banner_rounded_image/banner_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/user_data_controller.dart';

class UserProfilesTile extends StatelessWidget {
  const UserProfilesTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Obx(
        () => ListTile(
          contentPadding: EdgeInsets.zero,
          leading: AppRoundedImage(
            imageUrl: controller.user.value.profilePicture.isNotEmpty
                ? controller.user.value.profilePicture
                : AppImages.user,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
            applyImageRadius: true,
            borderRadius: 100,
            isNetworkImage: controller.user.value.profilePicture.isNotEmpty,
          ),
          title: Text(
            controller.user.value.userName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: AppColor.white),
          ),
          subtitle: Text(
            controller.user.value.email,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: AppColor.darkGrey),
          ),
          trailing: IconButton(
            onPressed: () {
              Get.to(() => const ProfileScreen());
            },
            icon: const Icon(
              Iconsax.edit,
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
