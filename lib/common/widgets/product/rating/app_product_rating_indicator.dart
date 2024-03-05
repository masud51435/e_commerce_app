import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppProductRatingIndicator extends StatelessWidget {
  const AppProductRatingIndicator({
    super.key,
    required this.rating,
    required this.reviews,
    this.size = 30,
    this.doStyle = false,
  });
  final double rating, size;
  final String reviews;
  final bool doStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemSize: size,
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItem / 1.5,
        ),
        Text(
          '($reviews)',
          style: doStyle
              ? Theme.of(context).textTheme.bodySmall
              : Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
