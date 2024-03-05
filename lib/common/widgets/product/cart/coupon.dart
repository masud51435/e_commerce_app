import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utlities.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shape/container/rounded_container.dart';

class AppCouponCode extends StatelessWidget {
  const AppCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    final width = AppDeviceUtils.getScreenWidth();
    return AppRoundedContainer(
      width: width,
      showBorder: true,
      padding: const EdgeInsets.all(AppSizes.sm),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'Have a Promo Code ? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.2,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.withOpacity(0.2),
                foregroundColor: dark
                    ? AppColor.white.withOpacity(0.5)
                    : AppColor.dark.withOpacity(0.5),
                side: BorderSide(
                  color: AppColor.grey.withOpacity(0.1),
                ),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
