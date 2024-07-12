import 'package:f/features/authentication/screens/signup/sign_widget/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:get/get.dart';

class fTermsandConditionsCheckbox extends StatelessWidget {
  const fTermsandConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = fHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 10,
            height: 14,
            child: Obx(() =>
               Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
              ),
            )),
        const SizedBox(
          width: fSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: "${fTexts.iAgreeTo }",
              style: Theme.of(context).textTheme.labelLarge),
          TextSpan(
              text: "${fTexts.privacypolicy }",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(
                color: dark ? fColors.white : fColors.primary,
                decoration: TextDecoration.underline,
                decorationColor:
                dark ? fColors.white : fColors.primary,
              )),
          TextSpan(
              text: "${fTexts. and }",
              style: Theme.of(context).textTheme.labelLarge),
          TextSpan(
              text: fTexts.termsofuse,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(
                  color:
                  dark ? fColors.white : fColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark
                      ? fColors.white
                      : fColors.primary)),
        ]))
      ],
    );
  }
}