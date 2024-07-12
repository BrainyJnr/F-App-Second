import 'package:cached_network_image/cached_network_image.dart';
import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/features/personalization/screens/brand/brand_products.dart';
import 'package:f/features/shops/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:get/get.dart';

import '../../features/authentication/screens/shimmer.dart';
import 'fBrandCard.dart';

class fBrandshowCase extends StatelessWidget {
  const fBrandshowCase({
    super.key,
    required this.images, required this.brand,

  });


  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProduct(brand: brand)),
      child: fRoundedContainer(
        showBorder: true,
        borderColor: fColors.darkerGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(fSizes.md),
        margin: const EdgeInsets.only(
            bottom: fSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Brand with Product Count
             fBrandCard(
              showBorder: false, brand: brand,
            ),

            /// Brand Top 3 Product Images
            Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),)
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget (String image, context){
    return Expanded(child: fRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(fSizes.md),
      margin: const EdgeInsets.only(right: fSizes.sm),
      backgroundColor: fHelperFunctions.isDarkMode(context) ? fColors.darkerGrey : fColors.light,
      child: CachedNetworkImage(
        fit: BoxFit.contain,
          imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) => fShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => Icon(Icons.error),

      ),
    ));
  }
}




