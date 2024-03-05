import 'package:flutter/material.dart';

import 'app_rating_and_progress.dart';

class OverAllProductRatings extends StatelessWidget {
  const OverAllProductRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '4.3',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const Column(
          children: [
            AppRatingProcessIndicator(value: 0.6, text: '5'),
            AppRatingProcessIndicator(value: 0.5, text: '4'),
            AppRatingProcessIndicator(value: 0.4, text: '3'),
            AppRatingProcessIndicator(value: 0.3, text: '2'),
            AppRatingProcessIndicator(value: 0.2, text: '1'),
          ],
        ),
      ],
    );
  }
}

