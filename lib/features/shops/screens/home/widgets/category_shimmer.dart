import 'package:f/features/authentication/screens/shimmer.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';

class fCategoryShimmer extends StatelessWidget {
  const fCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.separated(
            itemCount: itemCount,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(
                  width: fSizes.spaceBtwItems,
                ),
            itemBuilder: (_, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Image
                  fShimmerEffect(
                    width: 55,
                    height: 55,
                    radius: 55,
                  ),
                  SizedBox(
                    height: fSizes.spaceBtwItems / 2,
                  ),

                  /// Text
                  fShimmerEffect(width: 55, height: 8),
                ],
              );
            }));
  }
}
