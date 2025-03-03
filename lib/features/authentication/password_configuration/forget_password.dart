import 'package:f/features/authentication/password_configuration/reset_password.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:f/utilis/validators/Validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../forget_password/forget_password_controller.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(fSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              fTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: fSizes.spaceBtwItems,
            ),
            Text(
              fTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 19,
            ),

            /// Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: fValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: fTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            SizedBox(
              height: fSizes.spaceBtwSections,
            ),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>  controller.sendPasswordResetEmail(),
                  child: const Text(fTexts.submit)),
            )
          ],
        ),
      ),
    );
  }
}
