import 'package:f/common/styles/spacing_styles.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed,});

  final String image,title,subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: fSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            /// Image
            Image(image:  AssetImage(image),width: fHelperFunctions.screenWidth() * 6,),
            const SizedBox(height: fSizes.spaceBtwSections,),

            /// Title & SubTitle
            Text(
              title, style: Theme
                .of(context)
                .textTheme
                .titleLarge, textAlign: TextAlign.center,),
            const SizedBox(height: fSizes.spaceBtwItems,),
            Text(subTitle, style: Theme
                .of(context)
                .textTheme
                .labelMedium, textAlign: TextAlign.center,),
            const SizedBox(height: fSizes.spaceBtwItems,),

            /// Buttons
            SizedBox(width: double.infinity,
            child: ElevatedButton(onPressed: onPressed,child: const Text(fTexts.fcontinue),),
            )
          ],
        ),
        )
      ),
    );
  }
}
