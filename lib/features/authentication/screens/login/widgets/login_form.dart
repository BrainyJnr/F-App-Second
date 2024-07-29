import 'package:f/features/authentication/password_configuration/forget_password.dart';
import 'package:f/features/authentication/screens/signup/sign_widget/signup.dart';
import 'package:f/utilis/validators/Validation.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../navigation_menu.dart';
import '../../../login/logn_controller.dart';

class fLoginForm extends StatelessWidget {
  const fLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: fSizes.spaceBtwSections),
        child: Column(children: [
          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => fValidator.validateEmail(value),
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: fTexts.email),
          ),
          const SizedBox(
            height: fSizes.spaceBtwInputFields,
          ),

          /// Password
          Obx(
            ()=> TextFormField(
              validator: (value) => fValidator.validatePassword(value),
             controller: controller.password,
             obscureText: controller.hidePassword.value,
              decoration:  InputDecoration(
             labelText: fTexts.password,
             prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon:
               IconButton(onPressed: () => controller.hidePassword.value
                   = !controller.hidePassword.value, icon: Icon(controller.hidePassword.value?
                   Iconsax.eye_slash : Iconsax.eye),
            ),
          ),
              )
            ),
          const SizedBox(
            height: fSizes.spaceBtwInputFields / 2,
          ),

          /// Remember Me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember Me
              Row(
                children: [
                  Obx(()=> Checkbox(value: controller.rememberMe.value,
                      onChanged: (value)  => controller.rememberMe.value = !controller.rememberMe.value)),
                  const Text(fTexts.rememberMe),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),

              /// Forget Password
              TextButton(
                  onPressed: () => Get.to(() => forgetPassword()),
                  child: const Text(
                    fTexts.forgetpassword,
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          ),
          const SizedBox(
            height: fSizes.spaceBtwSections,
          ),

          /// Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.emailAndPasswordSignIn(),
              child: const Text(fTexts.signIn),
            ),
          ),
          const SizedBox(height: fSizes.spaceBtwSections),

          /// Create Account Button
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(
                  fTexts.createAccount,
                  style: TextStyle(color: Colors.blue),
                ),
              )),
          //const SizedBox(height: fSizes.spaceBtwSections,),
          SizedBox(
            height: 8,
          )
        ]),
      ),
    );
  }
}
