import 'package:flutter/material.dart';

import '../../../../../common/widgets/icons/verified_brand_logo.dart';
import '../../../../../common/widgets/text/product_title_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utlities.dart';

class AppCartItem extends StatelessWidget {
  const AppCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = AppDeviceUtils.getScreenWidth();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerifiedBrandLogo(
              brandName: 'Nike',
            ),
            SizedBox(
              width: width * 0.45,
              child: const ProductTitleText(
                maxLine: 2,
                smallSize: false,
                text: 'Green Nike Air Shoes',
              ),
            ),
            Row(
              children: [
                const Text('Color : '),
                SizedBox(
                  width: width * 0.30,
                  child: Text(
                    'Green,',
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text('size : '),
                Text(
                  'EU 40',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(AppSizes.sm),
          ),
          child: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
