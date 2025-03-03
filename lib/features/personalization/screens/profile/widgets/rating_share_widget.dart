import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:f/utilis/constants/sizes.dart';

class fRatingandShare extends StatelessWidget {
  const fRatingandShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///Ratings
        Row(
          children: [
            Padding(padding: EdgeInsets.only(right: fSizes.defaultSpace,  )),
            const Icon(Iconsax.star5, color: Colors.amber, size: 24,),
            const SizedBox(width: fSizes.spaceBtwItems / 2,),
            Text.rich(TextSpan(
                children: [
                  TextSpan(text: "5.0",style: Theme.of(context).textTheme.bodyMedium ),
                  const TextSpan(text: "(199)")
                ]
            ))
          ],
        ),
        /// Share Button
        IconButton(onPressed: (){}, icon: const Icon(Icons.share, size: fSizes.iconMd,))
      ],
    );
  }
}
