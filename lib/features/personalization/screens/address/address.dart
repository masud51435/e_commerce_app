import 'package:e_commerce_app/features/personalization/screens/address/new_address.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../../utils/constants/colors.dart';
import 'widgets/customer_address_line.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = AppDeviceUtils.getScreenWidth();
    // final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              CustomerAddressLine(selected: true,),
              CustomerAddressLine(),
              CustomerAddressLine(),
              CustomerAddressLine(),
              CustomerAddressLine(),
              CustomerAddressLine(),
              CustomerAddressLine(),
              CustomerAddressLine(),
              CustomerAddressLine(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () => Get.to(() => const NewAddressScreen()),
        child: const Icon(
          Icons.add,
          color: AppColor.white,
        ),
      ),
    );
  }
}
