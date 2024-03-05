import 'package:e_commerce_app/bottom_nav_bar/custom_nav_bar.dart';
import 'package:e_commerce_app/common/widgets/account_success/account_success.dart';
import 'package:e_commerce_app/common/widgets/commonbtn/commonbutton.dart';
import 'package:e_commerce_app/common/widgets/custom_shape/container/rounded_container.dart';

import 'package:e_commerce_app/features/shop/screens/cart/widgets/order_item.dart';
import 'package:e_commerce_app/features/shop/screens/checkOut/widgets/app_payment_method.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../../common/widgets/product/cart/coupon.dart';

import 'widgets/app_billing_address.dart';
import 'widgets/billing_payment_section.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = AppHelperFunctions.isDarkMode(context);
    // final height = AppDeviceUtils.getScreenHeight();
    // final width = AppDeviceUtils.getScreenWidth();
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              ProductOrderItem(
                showAddRemoveButton: false,
              ),
              SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              AppCouponCode(),
              SizedBox(
                height: AppSizes.spaceBtwSection,
              ),
              AppRoundedContainer(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: AppSizes.md,
                ),
                showBorder: true,
                child: Column(
                  children: [
                    PriceItem(),
                    Divider(),
                    SizedBox(
                      height: AppSizes.spaceBtwItem,
                    ),
                    AppPaymentMethod(),
                    SizedBox(
                      height: AppSizes.spaceBtwItem,
                    ),
                    AppBillingAddress(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: CommonBtn(
          title: 'Order Now  \$290.0',
          onPress: () => Get.to(
            () => AccountSuccess(
              image: AppImages.paymentSuccessAnimation,
              title: 'Payment Success',
              subTitle: 'Your item will be shipped soon',
              onpress: () => Get.offAll(
                () => CustomNavBar(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
