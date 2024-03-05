import 'package:e_commerce_app/common/widgets/appbar/Custom_appbar.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/product/rating/app_product_rating_indicator.dart';
//import '../../../../utils/device/device_utlities.dart';
import 'widgets/over_all_product_ratings.dart';
import 'widgets/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = AppHelperFunctions.isDarkMode(context);
    // final height = AppDeviceUtils.getScreenHeight();
    // final width = AppDeviceUtils.getScreenWidth();
    return const Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Ratings & Reviews',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ratings and Reviews are verified and are from people who use the same type of device that you use.',
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              OverAllProductRatings(),
              SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              AppProductRatingIndicator(
                rating: 4.3,
                reviews: '1030',
              ),
              SizedBox(
                height: AppSizes.spaceBtwSection,
              ),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
