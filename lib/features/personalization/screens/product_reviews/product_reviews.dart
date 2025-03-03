import 'package:f/features/personalization/screens/product_reviews/widget/user_review_card.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/colors.dart';

import 'package:f/features/personalization/screens/product_reviews/widget/rating_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/Ratings/rating_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// -- AppBar
      appBar: fAppBar(title: Text("Reviews & Ratings"),showBackArrow: true,),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(fSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ratings and reviews are verified and are from people who use the same type of device that you use.",style: Theme.of(context).textTheme.labelLarge,),
            const SizedBox(height: fSizes.spaceBtwItems,),

            /// Rating Product Rating
            fOverallProdutRating(),
            fRatingBarIndicator(rating: 3.5,),
            Text("12,612",style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: fSizes.spaceBtwSections,),

            /// User Reviews List
            UserReviewCard(),
            UserReviewCard(),
            UserReviewCard(),
            UserReviewCard(),
        ]),
      ),
      ));
  }
}



