import 'package:f/features/shops/models/brand_model.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/colors.dart';

import '../../utilis/constants/enums.dart';
import '../styles/fRoundedContainer.dart';
import '../widgets/f_circular Images.dart';
import 'f_brand_title_text_with_verified_icon.dart';

class fBrandCard extends StatelessWidget {
  const fBrandCard({
    super.key,
    this.onTap,
    required this.showBorder, required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = fHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: fRoundedContainer(
      showBorder: showBorder,
        backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(fSizes.sm),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- Icon
            Flexible(
              child: fCircular_Images(
                isNetworkImage : true,
                image : brand.image,
               // backgroundColor: Colors.transparent,
                overlayColor: isDark ? fColors.white : fColors.black ,
              ),
            ),
            const SizedBox(width: fSizes.spaceBtwItems / 2,),



            /// -- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  fBrandTitleWithVerificationIcon(title: brand.name,brandTextSize: TextSizes.large ,),
                  Text("${brand.productsCount ?? 0} products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  )



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
