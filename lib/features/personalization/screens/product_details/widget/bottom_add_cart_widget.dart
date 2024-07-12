import 'package:f/common/widgets/icons/f_circular_icon.dart';
import 'package:f/features/personalization/controllers/cart_controller.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../shops/models/product_model.dart';

class fBottomAddCart extends StatelessWidget {
  const fBottomAddCart({super.key,required this.product});

  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = fHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: fSizes.defaultSpace, vertical: fSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? fColors.darkerGrey : fColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(fSizes.cardRadiusLg),
          topRight: Radius.circular(fSizes.cardRadiusLg),
        )),
      child: Obx(()
        => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                  Row(
            children: [
                fCircularIcon(icon: Iconsax.minus,
                backgroungColor: fColors.darkerGrey,
                  width: 40,
                  height: 40,
                  color: fColors.white,
                  onpressed: ()=> controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(width: fSizes.spaceBtwItems,),
                Text(controller.productQuantityInCart.value.toString(),style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(width: fSizes.spaceBtwItems,),
                 fCircularIcon(icon: Iconsax.add,
               backgroungColor: fColors.black,
               width: 40,
               height: 40,
               color: fColors.white,
                  onpressed: () => controller.productQuantityInCart.value += 1,
                )
              ],
            ),
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(fSizes.md),
                    backgroundColor: fColors.black,
                side: const BorderSide(color: fColors.black),
              ),
              child: const Text("Add to Cart"),

            )],
          ),
      ),

    );
  }
}
