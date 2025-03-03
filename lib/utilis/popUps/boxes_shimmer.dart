import 'package:f/features/authentication/screens/shimmer.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';

class fBoxesShimmer extends StatelessWidget {
  const fBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: fShimmerEffect(width: 150,height: 110,)),
            SizedBox(width: fSizes.spaceBtwItems,),
            Expanded(child: fShimmerEffect(width: 150,height: 110,)),
            SizedBox(width: fSizes.spaceBtwItems,),
            Expanded(child: fShimmerEffect(width: 150,height: 110,)),



          ],
        )
      ],
    );
  }
}
