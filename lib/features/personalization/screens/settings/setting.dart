import 'package:e_commerce_app/common/widgets/custom_shape/container/primary_header_container.dart';

import 'package:e_commerce_app/common/widgets/text/section_heading/section_heading.dart';
import 'package:e_commerce_app/data/repositories/upload_data/upload_all_data.dart';
import 'package:e_commerce_app/features/personalization/screens/address/address.dart';
import 'package:e_commerce_app/features/personalization/screens/settings/widgets/SettingMenuTile.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart.dart';
import 'package:e_commerce_app/features/shop/screens/order/order.dart';

import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../data/repositories/authentication/authentication_repo.dart';
import '../../../../utils/device/device_utlities.dart';

import 'widgets/settingAppbar.dart';
import 'widgets/userProfilesTile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = AppHelperFunctions.isDarkMode(context);
    //  final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppPrimaryHeader(
              child: Column(
                children: [
                  SettingAppBar(),
                  UserProfilesTile(),
                  SizedBox(
                    height: AppSizes.spaceBtwSection,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const AppSectionHeading(
                    text: 'Account Setting',
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItem),
                  SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subTitle: 'Set Shopping Delivery Address',
                    onTap: () => Get.to(
                      () => const AddressScreen(),
                    ),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Set Shopping Delivery Address',
                    onTap: () => Get.to(
                      () => const CartScreen(),
                    ),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'Set Shopping Delivery Address',
                    onTap: () => Get.to(
                      () => const OrderScreen(),
                    ),
                  ),
                  const SettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Set Shopping Delivery Address',
                  ),
                  const SettingMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'Set Shopping Delivery Address',
                  ),
                  const SettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set Shopping Delivery Address',
                  ),
                  const SettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Set Shopping Delivery Address',
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSection,
                  ),
                  const AppSectionHeading(
                    text: 'App Setting',
                  ),
                  SettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Your Document Here',
                    onTap: () => Get.to(() => const UploadAllData()),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.location,
                    title: 'GeoLocation',
                    subTitle: 'Upload Your Location Here',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search Result is Safe For All Ages',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set Your Desire Image Quality',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem,
                  ),
                  SizedBox(
                    width: width,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logOut(),
                      child: const Text('LogOut'),
                    ),
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
