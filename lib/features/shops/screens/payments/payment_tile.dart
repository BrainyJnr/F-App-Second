import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/common/widgets/images/f_rounded_image.dart';
import 'package:f/features/personalization/controllers/checkout_controller.dart';
import 'package:f/features/shops/models/payment_method_model.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class fPaymentTile extends StatelessWidget {
  const fPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: fRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: fHelperFunctions.isDarkMode(context) ? fColors.light : fColors.white,
        padding: EdgeInsets.all(fSizes.sm),
        child: Image(image: AssetImage(paymentMethod.image),fit: BoxFit.contain,),
      ),
      title: Text(paymentMethod.name),
      trailing: Icon(Iconsax.arrow_right_34),
      
    
    );
  }
}
