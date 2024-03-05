import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/product/product_card/app_vertical_product_card.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_string.dart';
//import '../../../../utils/device/device_utlities.dart';
import '../../../../utils/helpers/helper_functions.dart';


class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    // final height = AppDeviceUtils.getScreenHeight();
    //  final width = AppDeviceUtils.getScreenWidth();
    
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          AppTexts.wishList,
          style: Theme.of(context).textTheme.headlineMedium!.apply(
                color: dark ? AppColor.white : AppColor.black,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Iconsax.add,
              color: dark ? AppColor.white : AppColor.dark,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            AppGridLayout(
              // height: height * 0.33,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) =>
                  AppVerticalProductCard(
                product: ProductModel.empty(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
