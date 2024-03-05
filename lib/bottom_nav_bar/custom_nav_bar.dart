import 'package:e_commerce_app/features/personalization/screens/settings/setting.dart';
import 'package:e_commerce_app/features/shop/screens/home/home.dart';
import 'package:e_commerce_app/features/shop/screens/store/store.dart';
import 'package:e_commerce_app/features/shop/screens/wishList/wishList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});

  final NavbarController controller = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.currentIndex.value,
          elevation: 0.5,
          height: 70,
          onDestinationSelected: (int index) =>
              controller.currentIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(
              icon: Badge(
                label: Text('2'),
                child: Icon(Iconsax.heart),
              ),
              label: 'Wishlist',
            ),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(
        () => controller.screens[controller.currentIndex.value],
      ),
    );
  }
}

class NavbarController extends GetxController {
  RxInt currentIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const AppStore(),
    const WishListScreen(),
    const SettingScreen(),
  ];
}
