import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/common/widgets/appbar/appbar.dart';
import 'package:f/common/widgets/products/cart/widgets/fcart_items.dart';
import 'package:f/features/authentication/models/address_model.dart';
import 'package:f/features/personalization/controllers/address_controller.dart';
import 'package:f/features/personalization/controllers/cart_controller.dart';
import 'package:f/features/personalization/screens/address/add_new_address.dart';
import 'package:f/features/personalization/screens/address/address.dart';
import 'package:f/features/personalization/screens/address/widgets/single-address.dart';
import 'package:f/features/shops/controllers/products/order_controller.dart';
import 'package:f/features/shops/screens/CheckOut/Widget/billing_address_sections.dart';
import 'package:f/features/shops/screens/CheckOut/Widget/billing_payment_section.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:f/utilis/helpers/pricing%20calculator.dart';
import 'package:f/utilis/popUps/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:f/utilis/constants/image_strings.dart';

import '../../../../Navigation_menu.dart';
import '../../../../common/widgets/products/cart/Coupon_Widget.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import 'Widget/billing_amount_section.dart';


class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = fPricingCalculator.calculateTotalPrice(subTotal, "US");
    final dark = fHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: fAppBar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body:   Padding(padding: EdgeInsets.all(fSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const fCartItems(showAddRemoveButtons: false,),
        const SizedBox(height: fSizes.spaceBtwSections,),

        /// -- Coupon TextField
        fCouponCode(),
        const SizedBox(height: 14,),

        /// -- Billing Section
        fRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(fSizes.md),
            backgroundColor: dark ? fColors.black : fColors.white,
             child: Column(
                children: [
            /// Pricing
            fBillingAmountSection(),
            const SizedBox(height: 10),

            /// Divider
            const Divider(),
            const SizedBox(height: 10),

            /// Payment Methods
            fBillingPaymentSection(),
            const SizedBox(height: 10),

            /// Address
            fBillingAddressSection(),

                  SizedBox(height: fSizes.defaultSpace,)

            ]
        ),
      )
      ],

          ))),


      bottomNavigationBar:
         Padding(
          padding: const EdgeInsets.all(fSizes.defaultSpace),
          child: ElevatedButton(

          //  style: ElevatedButton.styleFrom(),
            onPressed: subTotal > 0
          ? () => orderController.processOrder(totalAmount)
            : () => fLoaders.warningSnackBar(title: "Empty Cart",message: "Add items in the cart in order to proceed"),
            child: Text("Checkout \$$totalAmount")),

            ),
          //ElevatedButton(onPressed: () => Get.to(() => UserAddressScreen()), child: Text("Change Address",),
            //  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(8)),


      ); }
}


              /// -- Items in Cart



