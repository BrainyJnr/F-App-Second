import 'package:f/Navigation_menu.dart';
import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/common/texts/f_brand_title_text_with_verified_icon.dart';
import 'package:f/common/widgets/appbar/appbar.dart';
import 'package:f/common/widgets/icons/f_circular_icon.dart';
import 'package:f/common/widgets/images/f_rounded_image.dart';
import 'package:f/common/widgets/loader/animated_loader.dart';
import 'package:f/common/widgets/product_price_text.dart';
import 'package:f/common/widgets/products/cart/widgets/fcart_items.dart';
import 'package:f/common/widgets/texts/product_teitle_text.dart';
import 'package:f/features/personalization/controllers/cart_controller.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../common/widgets/products/cart/widgets/loader_widget.dart';
import '../CheckOut/check_out_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: fAppBar(
        showBackArrow: true,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body:




      Obx(
            () {
              ///Nothing Found Widget
              final emptyWidget = fAnimationLoaderWidget(
                text: "Whoops! Cart is Empty my Gee....",
                image: "https://img.freepik.com/free-vector/empty-cart-concept-illustration_114360-17701.jpg",
                showAction: true,
                actionText: "Let\'s fill it mannnn, You are eligible enough my Gee....",
                onActionPressed: () => Get.off(() => NavigationMenu()),
              );

              if (controller.cartItems.isEmpty) {
                return emptyWidget;
              } else {

                return( const Padding(padding: EdgeInsets.all(fSizes.defaultSpace),
                  /// -- Items In Cart
                          child: fCartItems(),


                ));

              }
            } ),

      /// -- Checkout Button
      bottomNavigationBar:controller.cartItems.isEmpty ? SizedBox() : Padding(
        padding: const EdgeInsets.all(fSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(()=>CheckOutScreen()),
          child:  Obx(() =>  Text("Checkout \$${controller.totalCartPrice.value}"))
      ),
      ),
    );

  }
}
