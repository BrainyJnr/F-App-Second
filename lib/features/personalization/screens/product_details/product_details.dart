import 'package:f/common/widgets/texts/success_heading.dart';
import 'package:f/features/personalization/screens/product_details/widget/bottom_add_cart_widget.dart';
import 'package:f/features/personalization/screens/product_details/widget/product_attribute.dart';
import 'package:f/features/personalization/screens/profile/widgets/product_meta_data.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:f/features/personalization/screens/product_details/widget/product_attribute.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utilis/constants/enums.dart';
import '../product_reviews/product_reviews.dart';
import '../profile/widgets/product_detail_image_slider.dart';
import '../profile/widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const  ProductDetailScreen({super.key, required this.product, //required this.productId
   });

  final ProductModel product;
 // final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: fBottomAddCart(product: product) ,
      body: SingleChildScrollView(
          child: Column(
        children: [
          /// 1 - Product Image Slider
          fProductImageSlider(product: product, productId: product.id,),

          /// 2 - Product Details
          Padding(
              padding: EdgeInsets.only(
                  right: fSizes.defaultSpace, bottom: fSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share Button
                  fRatingandShare(),

                  /// - Price, Title, Stack, & Brand
                  Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      child: fProductmetaDetails(product: product,)),

                  /// -- Attribute
                  if(product.productType == ProductType.variable.toString())  fProductAttribute(product: product,),
                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: fSizes.spaceBtwSections,),

                  const SizedBox(
                    height: fSizes.spaceBtwSections,
                  ),

                  ///  -- CheckOut Button
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Checkout"),
                      ),
                    ),
                  ),

                  ///  -- Description
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,top: 13
                    ),
                    child: const fSectionHeading(title: "Description",showActionButton: false,),),
                  const SizedBox(
                    height: fSizes.spaceBtwItems,),
                     Padding(
                   padding: EdgeInsets.only(
                      left: 20,),
                child:    ReadMoreText(
                  product.description ?? "",
                    trimLines: 2,
                  trimMode : TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: "show less",
                    moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,),
                    lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,),
                  ),),
                  ///  -- Reviews
               const Divider(),
                  const SizedBox(height: fSizes.spaceBtwItems,),
              Padding(
                  padding: EdgeInsets.only(
                    left: 20,),
                child:   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  fSectionHeading(title: "Reviews(199)",showActionButton: false,),
                  IconButton(icon: const Icon(Iconsax.arrow_right_3,size: 18,),onPressed: ()=>Get.to(()=> const ProductReviewScreen()),)
                ],
              ),),

                  const SizedBox(height: fSizes.spaceBtwSections,),
                  

                ]))
        ],
      )),
    );
  }
}
