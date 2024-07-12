import 'package:f/common/styles/spacing_styles.dart';
import 'package:f/features/authentication/screens/login/widgets/login_form.dart';
import 'package:f/features/authentication/screens/login/widgets/login_header.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/widgets.login_signup/Form_Divider.dart';
import '../../../../common/styles/widgets.login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);

    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
              padding: fSpacingStyle.paddingWithAppBarHeight,
              child: Column(
                  children: [
                    /// Logo, Title & Sub-Title
              fLoginHeader(),

        ///Form
        fLoginForm(),

                 /// Divider
                    fFormDivider(dividerText: fTexts.orSignInWith.capitalize!,),
                    const SizedBox(width: fSizes.spaceBtwSections,),

                    /// Footer
                    fSocialButtons()

            ],
          ),)


    ));
  }
}






