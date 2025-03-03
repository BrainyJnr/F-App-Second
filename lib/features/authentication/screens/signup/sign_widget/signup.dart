import 'package:f/common/styles/widgets.login_signup/Form_Divider.dart';
import 'package:f/common/styles/widgets.login_signup/social_buttons.dart';
import 'package:f/features/authentication/screens/signup/sign_up_form.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(fSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                fTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: fSizes.spaceBtwSections,
              ),

              /// Form
              fsignupform(),
              const SizedBox(height: fSizes.spaceBtwSections,),

              /// Divider
              fFormDivider(dividerText: fTexts.orSignInWith.capitalize!),
              const SizedBox(height: 10),

              /// Social Buttton
              const fSocialButtons(),

            ],
          ),
        ),
      ),
    );
  }
}

