import 'package:f/common/widgets/success_screen/success_screen.dart';
import 'package:f/data/repoositories/authentication_repository.dart';
import 'package:f/features/authentication/screens/login/login.dart';
import 'package:f/features/authentication/screens/signup/sign_widget/verify_email_controller.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        // Padding to Give Default Equal Space on all sides in all screens.
        child: Padding(
          padding: EdgeInsets.all(fSizes.defaultSpace),
          child: Column(
              children: [
          /// Image
          Image(
          image: AssetImage(fImages.EmailImage2),
          width: fHelperFunctions.screenWidth() * 0.6,),

        /// Title & SubTitle
        Text(
          fTexts.confirmEmail, style: Theme
            .of(context)
            .textTheme
            .headlineMedium, textAlign: TextAlign.center,),
        const SizedBox(height: fSizes.spaceBtwItems,),
        Text(email ?? "", style: Theme
            .of(context)
            .textTheme
            .labelLarge, textAlign: TextAlign.center,),
        const SizedBox(height: fSizes.spaceBtwItems,),
        Text(fTexts.confirmEmailSubTitle, style: Theme
            .of(context)
            .textTheme
            .labelMedium, textAlign: TextAlign.center,),
        const SizedBox(height: fSizes.spaceBtwSections,),

        /// Buttons
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => controller.checkEmailVerificationStatus(),
            child: const Text(fTexts.fcontinue),),),
          const SizedBox(
            height: fSizes.spaceBtwItems,),
          SizedBox(width: double.infinity,
            child: TextButton(
              onPressed: () => controller.sendEmailVerification(), child: const Text(fTexts.resendEmail),),)
          ],
        ),
      ),
    ),);
  }
}
