import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/common/widgets/texts/success_heading.dart';
import 'package:f/features/personalization/controllers/checkout_controller.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:get/get.dart';

class fBillingPaymentSection extends StatelessWidget {
  const fBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(CheckoutController());
    final dark = fHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        fSectionHeading(title: "Payment Method",buttonTitle: "Change",onPressed: () => controller.selectPaymentMethod(context),),
        const SizedBox(height: fSizes.spaceBtwItems / 2,),
        Obx(
          () => Row(
            children: [
              fRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? fColors.light : fColors.white,
                padding: const EdgeInsets.all(fSizes.sm),
                child:  Image(image: AssetImage(controller.selectedPaymentMethod.value.image),fit: BoxFit.contain,),
              ),
              const SizedBox(width: fSizes.spaceBtwItems / 2,),
              Text(controller.selectedPaymentMethod.value.name,style: Theme.of(context).textTheme.bodyLarge,)
            ],
          ),
        )
      ],
    );
  }
}
