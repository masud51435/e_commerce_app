import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class ProductRatingAndShare extends StatelessWidget {
  const ProductRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.star1,
              color: Colors.amber,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItem / 2,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '4.8',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const TextSpan(text: '(175)'),
                ],
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: AppSizes.iconMd,
          ),
        ),
      ],
    );
  }
}
