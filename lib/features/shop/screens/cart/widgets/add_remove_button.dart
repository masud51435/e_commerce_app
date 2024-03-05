import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shape/container/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AddRemoveButton extends StatelessWidget {
  const AddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppRoundedContainer(
          onTap: () {},
          height: 30,
          width: 30,
          color: dark ? AppColor.darkerGrey : AppColor.grey,
          child: const Icon(
            Iconsax.minus,
          ),
        ),
        const SizedBox(width: AppSizes.spaceBtwItem),
        Text(
          '1',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(width: AppSizes.spaceBtwItem),
        AppRoundedContainer(
          onTap: () {},
          height: 30,
          width: 30,
          color: AppColor.primaryColor,
          child: const Icon(
            Iconsax.add4,
            color: AppColor.white,
          ),
        ),
      ],
    );
  }
}
