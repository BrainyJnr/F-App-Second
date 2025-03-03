import 'package:f/features/authentication/screens/shimmer.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';

class fListTileShimmer extends StatelessWidget {
  const fListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            fShimmerEffect(width: 50, height: 50,radius: 50,),
            SizedBox(width: fSizes.spaceBtwItems,),
            Column(
              children: [
                fShimmerEffect(width: 100, height: 15),
                SizedBox(height: fSizes.spaceBtwItems / 2,),
                fShimmerEffect(width: 80, height: 12),


              ],
            )
          ],
        )
      ],
    );
  }
}
