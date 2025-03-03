import 'package:f/features/authentication/screens/signup/sign_widget/signup_controller.dart';
import 'package:f/features/authentication/screens/signup/sign_widget/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utilis/validators/Validation.dart';
import 'Terms&Conditions Checkbox.dart';

class fsignupform extends StatelessWidget {
  const fsignupform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        controller: controller.firstName,
                        validator: (value) =>
                            fValidator.validateEmptyText("First name", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: fTexts.firstName,
                            prefixIcon: Icon(Iconsax.user)))),
                const SizedBox(
                  width: fSizes.spaceBtwInputFields,
                ),
                Expanded(
                    child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      fValidator.validateEmptyText("Last name", value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: fTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ))
              ],
            ),
            const SizedBox(
              height: fSizes.spaceBtwInputFields,
            ),

            /// Username
            TextFormField(
              validator: (value) =>
                  fValidator.validateEmptyText("Username", value),
              controller: controller.userName,
              expands: false,
              decoration: const InputDecoration(
                  labelText: fTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            SizedBox(
              height: fSizes.spaceBtwInputFields,
            ),

            /// Email
            TextFormField(
              validator: (value) => fValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                labelText: fTexts.email,
                prefixIcon: Icon(Iconsax.direct),
              ),
            ),
            SizedBox(
              height: fSizes.spaceBtwInputFields,
            ),

            /// Phone Number
            TextFormField(
                validator: (value) => fValidator.validatePhoneNumber(value),
                controller: controller.phoneNumber,
                decoration: const InputDecoration(
                  labelText: fTexts.phoneNo,
                  prefixIcon: Icon(Iconsax.call),
                )),
            const SizedBox(
              height: fSizes.spaceBtwInputFields,
            ),

            /// Password
            Obx(
              () => TextFormField(
                validator: (value) => fValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: fTexts.password,
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                    )),
              ),
            ),
            const SizedBox(
              height: fSizes.spaceBtwInputFields,
            ),

            /// Terms&Conditions Checkbox
            const fTermsandConditionsCheckbox(),
            const SizedBox(height: 18),

            /// Sign Up Button'
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),
               // onPressed: () => Get.to(()=> VerifyEmailScreen()),
                child: const Text(fTexts.createAccount),
              ),
            ),
          ],
        ));
  }
}
