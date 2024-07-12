
import 'package:f/features/personalization/controllers/cart_controller.dart';
import 'package:f/features/shops/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class fCartCountericon extends StatelessWidget {
  const fCartCountericon({
    super.key,
     this.iconColor, this.counterBgColor, this.counterTextColor,
  });

  final Color? iconColor,counterBgColor,counterTextColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return SingleChildScrollView(
      child: Stack(
        children: [
          IconButton(
              onPressed: ()=>Get.to(()=> const CartScreen()),
              icon:  Icon(
                Iconsax.shopping_bag,
                color: iconColor,
              )),
          Positioned(
              right: 0,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    color: fColors.black,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Obx(
                    () =>  Text(
                      controller.noOfCartItems.value.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: fColors.white, fontSizeFactor: 0.8),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
