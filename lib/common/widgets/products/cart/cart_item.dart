import 'package:f/features/personalization/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:f/common/texts/f_brand_title_text_with_verified_icon.dart';
import 'package:f/common/widgets/images/f_rounded_image.dart';
import 'package:f/common/widgets/texts/product_teitle_text.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:flutter/widgets.dart';


class fCartItem extends StatelessWidget {
  const fCartItem({
    super.key, required this.cartItem,

  });

  final CartItemModel cartItem;


  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          fRoundedImage(imageUrl: cartItem.image ?? "",
            width: 60,
            height: 60,
            isNetworkImage: true,
            padding: const EdgeInsets.all(fSizes.sm),
            backgroundColor: fHelperFunctions.isDarkMode(context) ? fColors.darkGrey : fColors.light,
          ),
          const SizedBox(width: fSizes.spaceBtwItems,),

          /// Title, Price & Size
             Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fBrandTitleWithVerificationIcon(title: cartItem.brandName ?? ""),
                    Flexible(child: fProductTitleText(title:  cartItem.title,maxLines: 1,)),
                    /// Attribute
                    Text.rich(
                        TextSpan(
                            children: (
                            cartItem.selectedVariation ?? {}).entries.map((e) => TextSpan(
                              children: [
                                TextSpan(text: "${e.key}", style: Theme.of(context).textTheme.bodyLarge),
                                TextSpan(text: "${e.value}", style: Theme.of(context).textTheme.bodyLarge),
                              ]
                            )).toList(),)
                            )

                            ]
                        )
                    ),

                ],
    );
  }
}
