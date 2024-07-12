import 'package:f/common/widgets/layouts/grid_layouts.dart';
import 'package:f/features/authentication/screens/shimmer.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';

class fVerticalProductshimmer extends StatelessWidget {
  const fVerticalProductshimmer({super.key,
    this.itemCount = 4,
  
  });
  
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return fGridlayout(itemCount: itemCount, itemBuilder: (_, __) => SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          fShimmerEffect(width: 180, height: 180,),
          SizedBox(height: fSizes.spaceBtwItems,),

          /// Text
          fShimmerEffect(width: 160, height: 15),
          SizedBox(height: fSizes.spaceBtwItems /2,),
          fShimmerEffect(width: 110, height: 15),
        ],
      ),
    ));
  }
}
