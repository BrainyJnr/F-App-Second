

import 'package:f/features/personalization/controllers/cart_controller.dart';
import 'package:f/features/personalization/screens/product_details/product_details.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:f/utilis/constants/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/colors.dart';


class ProductCartAddToCartButton extends StatelessWidget {
  const ProductCartAddToCartButton({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {

         if(product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);

        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }

      },
      child: Obx(() {
          final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
          return Container(
            decoration:  BoxDecoration(
                color: productQuantityInCart > 0 ?  fColors.primary : fColors.dark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(fSizes.cardRadiusMd),
                  bottomRight: Radius.circular(fSizes.productImageRadius),
                )
            ),
            child:  SizedBox(
                width: fSizes.iconLg * 1.2,
                height: fSizes.iconLg * 1.2,
                child: Center(
                  child: productQuantityInCart > 0
                  ? Text(productQuantityInCart.toString(), style: Theme.of(context).textTheme.bodySmall!.apply(color: fColors.white))
                  :  Icon(Iconsax.add, color: fColors.white,),
                )
            ) );}
      ),
    );
  }
}
