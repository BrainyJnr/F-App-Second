import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/common/styles/shadows.dart';
import 'package:f/common/texts/f_brand_title_text_with_verified_icon.dart';
import 'package:f/common/widgets/favourite_icon/favourite_icon.dart';
import 'package:f/common/widgets/images/f_rounded_image.dart';
import 'package:f/common/widgets/product_price_text.dart';
import 'package:f/features/personalization/screens/product_details/product_details.dart';
import 'package:f/features/shops/controllers/products/product_controller.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:f/utilis/constants/enums.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../cart_button/add_to_cart_button.dart';
import '../icons/f_circular_icon.dart';
import '../texts/product_teitle_text.dart';



class fProductCardVertical extends StatelessWidget {
  const fProductCardVertical({super.key, required this.product, //required this.productId
   });

  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = fHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow
    return GestureDetector(
      onTap: ()=>Get.to(()=>ProductDetailScreen(product: product,)),
      child: Container(
        width: 180,


        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [fShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(fSizes.productImageRadius),
        color: dark ? fColors.darkerGrey : fColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            fRoundedContainer(
              width: 180,
              height: 180,
              padding: const EdgeInsets.all(fSizes.sm),
              backgroundColor: dark ? fColors.dark : fColors.light,
              child: Stack(
                children: [


                  /// -- Thumbnail Image
                  Center(
                    child: fRoundedImage(imageUrl: product.thumbnail,applyImageRadius:true,height: 170,backgroundColor: fHelperFunctions.isDarkMode(context) ? fColors.dark : fColors.light,isNetworkImage: true,
                                    ),
                  ),

                  /// -- Sale Tag
                  if(salePercentage != null)
                     Positioned(
                    top: 11,
                    child: fRoundedContainer(
                      radius: fSizes.sm,
                      backgroundColor: fColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: fSizes.sm,vertical: fSizes.xs),
                      child: Text("$salePercentage%",style: Theme.of(context).textTheme.labelSmall!.apply(color: fColors.black),),
                    ),
                  ),

                  /// -- Favourite Icon Button
                //InkWell(
                //  child:
                  Positioned(
                    top: 0,
                   // bottom: 1000,
                    right: 0,
                    child: fFavouriteIcon(productId: product.id,)),

                ],
              ),
            ),
          const SizedBox(height: fSizes.spaceBtwItems / 2,),

          /// -- Details
            Padding( padding: const EdgeInsets.only(left: fSizes.sm),
            child: SizedBox(
              width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               fProductTitleText(title: product.title,smallSize: true),
              SizedBox(height: fSizes.spaceBtwItems / 2,),
                fBrandTitleWithVerificationIcon(title: product.brand!.name)
                
              ],
                ))
            ),

         const Spacer(),

        /// Price Row
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Column(
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
        /// Add to cart Button
        ProductCartAddToCartButton(product: product,)

            ])
          ],
        ),

      ),
    );
  }
}



