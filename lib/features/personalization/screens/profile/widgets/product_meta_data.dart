import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/common/texts/f_brand_title_text_with_verified_icon.dart';
import 'package:f/common/texts/product_price_text.dart';
import 'package:f/common/widgets/f_circular%20Images.dart';
import 'package:f/common/widgets/texts/product_teitle_text.dart';
import 'package:f/features/shops/controllers/products/product_controller.dart';
import 'package:f/utilis/constants/enums.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/product_price_text.dart';
import '../../../../shops/models/product_model.dart';

class fProductmetaDetails extends StatelessWidget {
  const fProductmetaDetails({super.key,required this.product,

  });

  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = fHelperFunctions.isDarkMode(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      /// Price & Sale Price
      Row(
        children: [
          fRoundedContainer(
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
          const SizedBox(
            width: fSizes.spaceBtwItems,
          ),

          /// Price
          if(product.productType == ProductType.single.toString() && product.salePrice > 0)
          Text(
            "\$${product.price}",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .apply(decoration: TextDecoration.lineThrough),
          ),
          if(product.productType == ProductType.single.toString() && product.salePrice > 0)

            const SizedBox(
            width: fSizes.spaceBtwItems,
          ),
           fProductPriceText(
            price: controller.getProductPrice(product),
            isLarge: true,
          )
        ],
      ),
      const SizedBox(
        height: fSizes.spaceBtwItems / 1.5,
      ),

      /// Title
       fProductTitleText(title: product.title),
      const SizedBox(
        height: fSizes.spaceBtwItems / 1.5,
      ),

      /// Stock Status
      Row(
        children: [
          const fProductTitleText(title: "Status"),
          const SizedBox(
            width: fSizes.spaceBtwItems,
          ),
          Text(
            controller.getProductStockStatus(product.stock),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: fSizes.spaceBtwItems / 1.5,
          )
        ],
      ),
      const SizedBox(
        height: fSizes.spaceBtwItems / 1.9,
      ),

      /// Brand
//      Row(children: [
//         fCircular_Images(
//           image: product.brand != null ? product.brand!.image: "",
//           width: 32,
//           height: 32,
//           overlayColor: darkMode ? fColors.white : fColors.black,
//         ),
          fBrandTitleWithVerificationIcon(
         title: product.brand != null ? product.brand!.name : "",
          brandTextSize: TextSizes.medium,
        )

    ]);}
}
