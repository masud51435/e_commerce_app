import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/device/device_utlities.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? AppColor.black : AppColor.white,
      child: TabBar(
        tabs: tabs,
        tabAlignment: TabAlignment.start,
        padding: EdgeInsets.zero,
        indicatorColor: AppColor.primaryColor,
        unselectedLabelColor: AppColor.darkerGrey,
        labelColor: dark ? AppColor.white : AppColor.primaryColor,
        isScrollable: true,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(
        AppDeviceUtils.getAppBarHeight(),
      );
}
