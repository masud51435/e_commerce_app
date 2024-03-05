import 'package:flutter/material.dart';

import '../../../../../common/widgets/text/section_heading/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class AppBillingAddress extends StatelessWidget {
  const AppBillingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeading(
          text: 'Shipping Address',
          anotherItem: TextButton(
            onPressed: () {},
            child: const Text('Change'),
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItem),
        Text(
          'John Smith',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 2,
        ),
        const Row(
          children: [
            Icon(
              Icons.phone,
              size: AppSizes.iconSm,
            ),
            SizedBox(
              width: AppSizes.spaceBtwItem / 2,
            ),
            Text('+8801829346266'),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 2,
        ),
        const Row(
          children: [
            Icon(
              Icons.location_city,
              size: AppSizes.iconSm,
            ),
            SizedBox(
              width: AppSizes.spaceBtwItem,
            ),
            Expanded(
              child: Text(
                '394734 Main Street, New York, New York 1000l, United State',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
