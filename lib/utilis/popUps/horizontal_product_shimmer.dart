import 'package:f/features/authentication/screens/shimmer.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';

class fHorizontalProductShimmer extends StatelessWidget {
  const fHorizontalProductShimmer({super.key, this.itemCount = 1,

  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: fSizes.spaceBtwSections),
        height: 120,
        child: ListView.separated(
          itemCount: itemCount,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) =>
              SizedBox(width: fSizes.spaceBtwItems,),
          itemBuilder: (_, __) =>
             const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  fShimmerEffect(width: 120, height: 120),
                  SizedBox(width: fSizes.spaceBtwItems,),

                  /// Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: fSizes.spaceBtwItems / 2,),
                      fShimmerEffect(width: 160, height: 15),
                      SizedBox(height: fSizes.spaceBtwItems /2,),
                      fShimmerEffect(width: 110, height: 15),
                      SizedBox(height: fSizes.spaceBtwItems / 2,),
                      fShimmerEffect(width: 80, height: 15),
                      Spacer()
                    ],
                  )
                ],
              ),
        ));
  }
}
