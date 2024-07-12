import 'package:f/common/widgets/texts/success_heading.dart';
import 'package:f/features/shops/screens/payments/payment_tile.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shops/models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;
  
  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: "PayPal", image: fImages.Paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {

    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(fSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fSectionHeading(title: "Select Payment Method",showActionButton: false,),
                SizedBox(height: fSizes.spaceBtwSections,),
                fPaymentTile(paymentMethod: PaymentMethodModel(name: "Paypal",image: fImages.Paypal)),
                SizedBox(height: fSizes.spaceBtwItems/2,),
                fPaymentTile(paymentMethod: PaymentMethodModel(name: "Google Pay",image: fImages.GooglePay)),
                SizedBox(height: fSizes.spaceBtwItems/2,),
                fPaymentTile(paymentMethod: PaymentMethodModel(name: "Apple Pay",image: fImages.ApplePay)),
                SizedBox(height: fSizes.spaceBtwItems/2,),
                fPaymentTile(paymentMethod: PaymentMethodModel(name: "VISA",image: fImages.Visa)),
                SizedBox(height: fSizes.spaceBtwItems/2,),
                fPaymentTile(paymentMethod: PaymentMethodModel(name: "Master Card",image: fImages.MasterCard)),
                SizedBox(height: fSizes.spaceBtwItems/2,),
                fPaymentTile(paymentMethod: PaymentMethodModel(name: "Paytm",image: fImages.PayTm)),
                SizedBox(height: fSizes.spaceBtwItems/2,),
                fPaymentTile(paymentMethod: PaymentMethodModel(name: "PayStack",image: fImages.PayStack)),
                SizedBox(height: fSizes.spaceBtwItems/2,),
                fPaymentTile(paymentMethod: PaymentMethodModel(name: "Credit Card",image: fImages.CreditCard)),
                SizedBox(height: fSizes.spaceBtwItems/2,),
                SizedBox(height: fSizes.spaceBtwItems/2,)
              ],

            ),
          ),
        ));
  }
}