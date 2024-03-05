import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../../common/widgets/commonbtn/commonbutton.dart';
import '../../../../utils/constants/text_string.dart';

class NewAddressScreen extends StatelessWidget {
  const NewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Add New Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.call),
                    labelText: AppTexts.phoneNo,
                  ),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        expands: false,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.maps_home_work_outlined),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSizes.spaceBtwInputFields,
                    ),
                    Flexible(
                      child: TextFormField(
                        expands: false,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        expands: false,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.location_city_outlined),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSizes.spaceBtwInputFields,
                    ),
                    Flexible(
                      child: TextFormField(
                        expands: false,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.location_on_outlined),
                          labelText: 'State',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItem,
                ),
                CommonBtn(
                  onPress: () {},
                  title: 'Done',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
