import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/features/personalization/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../product_price_text.dart';
import '../add_remove_button.dart';
import '../cart_item.dart';

class fCartItems extends StatelessWidget {
  const fCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () =>
          //ListView(
        //children: [
         ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: cartController.cartItems.length,
                    separatorBuilder: (_, __) => const SizedBox(
                      height: fSizes.spaceBtwSections,
                    ),
                    itemBuilder: (_, index) => Obx(() {
                      final item = cartController.cartItems[index];
                      return  Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                            fCartItem(
                              cartItem: item,
                            ),
                            if (showAddRemoveButtons)
                              const SizedBox(
                                height: fSizes.spaceBtwItems,
                              ),

                            /// Add Remove Button Row With Total Price
                            if (showAddRemoveButtons)
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 70,
                                        ),

                                        /// Add Remove Button
                                        fQuantity_Product_With_Add_And_Remove(
                                          quantity: item.quantity,
                                          add: () => cartController.addOneToCart(item),
                                          remove: () =>
                                              cartController.removeOneFromCart(item),
                                        )
                                      ],
                                    ),

                                    /// --- Price total price
                                    fProductPriceText(
                                        price:
                                            (item.price * item.quantity).toStringAsFixed(1)),
                                  ])
                          ]);
                       } )
                       ),


       );



  }
}
