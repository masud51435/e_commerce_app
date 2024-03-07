import 'package:e_commerce_app/features/personalization/controllers/user_data_controller.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../../../common/widgets/simmer/simmer_loader.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_string.dart';

class homeAppBar extends StatelessWidget {
  const homeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CustomAppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: AppColor.grey,
                ),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return AppShimmerLoader(
                  height: 15,
                  width: Get.width * 0.3,
                );
              } else {
                return Text(
                  controller.user.value.userName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: AppColor.white,
                      ),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => Get.to(
            () => const CartScreen(),
          ),
          icon: const Badge(
            backgroundColor: Colors.red,
            textColor: AppColor.white,
            label: Text('2'),
            child: Icon(
              Iconsax.shopping_bag,
              color: AppColor.white,
            ),
          ),
        ),
      ],
    );
  }
}
