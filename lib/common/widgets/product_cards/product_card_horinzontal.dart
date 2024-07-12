import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/common/texts/f_brand_title_text_with_verified_icon.dart';
import 'package:f/common/widgets/images/f_rounded_image.dart';
import 'package:f/common/widgets/product_price_text.dart';
import 'package:f/common/widgets/texts/product_teitle_text.dart';
import 'package:f/features/shops/controllers/products/product_controller.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f/common/styles/shadows.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/shops/models/product_model.dart';
import '../../../utilis/constants/enums.dart';
import '../favourite_icon/favourite_icon.dart';
import '../icons/f_circular_icon.dart';

class fProductCardHorizontal extends StatelessWidget {
  const fProductCardHorizontal({super.key, required this.product});

  final ProductModel product;



  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fSizes.productImageRadius),
        color: dark ? fColors.darkerGrey : fColors.lightContainer,
      ),
      child: Row(children: [
        /// Thumbnail
        fRoundedContainer(
          height: 120,
          padding: const EdgeInsets.all(fSizes.sm),
          backgroundColor: dark ? fColors.dark : fColors.light,
          child: Stack(
            children: [
              /// Thumbnail Image
              SizedBox(
                height: 120,
                width: 120,
                child: fRoundedImage(
                  imageUrl: product.thumbnail, backgroundColor: fHelperFunctions.isDarkMode(context) ? fColors.dark : fColors.light,isNetworkImage: true,

                  applyImageRadius: true,)),

              /// -- Sale Tag
              if(salePercentage != null)
              Positioned(
                top: 11,
                child: fRoundedContainer(
                  radius: fSizes.sm,
                  backgroundColor: fColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: fSizes.sm, vertical: fSizes.xs),
                  child: Text(
                    "$salePercentage%",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: fColors.black),
                  ),
                ),
              ),

              /// -- Favourite Icon Button
              Positioned(
                  top: 0,
               //   bottom: 1000,
                  right: 0,
                  child: fFavouriteIcon(productId: product.id))
            ],
          ),
        ),

        /// Details
        SizedBox(
          width: 172,
          child: Padding(
            padding: EdgeInsets.only(top: fSizes.sm, left: fSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fProductTitleText(
                      title: product.title, smallSize: true,),
                    SizedBox(
                      height: fSizes.spaceBtwItems / 2,
                    ),
                    fBrandTitleWithVerificationIcon(title: product.brand!.name),
                  ],
                ),

                const Spacer(),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Column(
                          children: [
                            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                              Padding(padding: const EdgeInsets.only(left: fSizes.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context).textTheme.labelSmall!.apply(decoration: TextDecoration.lineThrough),
                                ),
                              ),
                            /// Price
                            Padding(padding: EdgeInsets.only(left: fSizes.sm),
                              child:  fProductPriceText(price: controller.getProductPrice(product)),),
                          ]) ),


                  /// Add to Cart Button
                  Container(
                      decoration: const BoxDecoration(
                          color: fColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(fSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(fSizes.productImageRadius),
                          )),
                      child: const SizedBox(
                          width: fSizes.iconLg * 1.2,
                          height: fSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: fColors.white,
                            ),
                          )))
                ])
              ],
            ),
          ),
        )
      ]),
    );
  }
}
