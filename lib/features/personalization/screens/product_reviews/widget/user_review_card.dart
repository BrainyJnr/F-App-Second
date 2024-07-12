import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/utilis/constants/colors.dart';

import 'package:f/common/widgets/products/Ratings/rating_indicator.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(fImages.Profile2),),
                    const SizedBox(width: fSizes.spaceBtwItems,),
                    Text("Godwin Sofia", style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,),
                  ]), IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),

            ],),
          const SizedBox(width: fSizes.spaceBtwItems,),

          /// Review
          Row(
            children: [
              fRatingBarIndicator(rating: 4),
              const SizedBox(width: fSizes.spaceBtwItems,),
              Text("28 May 2023", style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,),
            ],
          ),
          const SizedBox(height: fSizes.spaceBtwItems,),
          ReadMoreText(
            "The User interface of the app is quite intuitive. I was able to navigate and make purchase seamlessly, Great job!",
            trimLines: 1,
            trimMode: TrimMode.Line,
            trimExpandedText: "show less",
            trimCollapsedText: "show more",
            moreStyle: const TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: fColors.primary ),
            lessStyle: const TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: fColors.primary ),
          ),
          const SizedBox(height: fSizes.spaceBtwItems,),

          /// Company Review
          fRoundedContainer(
            backgroundColor: dark ? fColors.darkerGrey : fColors.grey,
            child: Padding(padding: EdgeInsets.all(fSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("F's Store",style: Theme.of(context).textTheme.titleMedium,),
                    Text("29 May 2023",style: Theme.of(context).textTheme.bodyMedium,)
                  ],
                ),
                SizedBox(height: fSizes.spaceBtwItems,),
                ReadMoreText(
                  "The User interface of the app is quite intuitive. I was able to navigate and make purchase seamlessly, Great job!",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: "show less",
                  trimCollapsedText: "show more",
                  moreStyle: const TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: fColors.primary ),
                  lessStyle: const TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: fColors.primary ),
                ),

              ],
            ),
            )
          ),
          SizedBox(height: fSizes.spaceBtwSections,)
        ]
    );
  }
}
