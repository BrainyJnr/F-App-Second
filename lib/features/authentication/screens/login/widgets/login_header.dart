import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class fLoginHeader extends StatelessWidget {
  const fLoginHeader({
    super.key,
  });




  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Image(
              height: 103,
              image: AssetImage(dark? fImages.favour: fImages.favour,)),
          Text(fTexts.loginTitle, style: Theme
              .of(context)
              .textTheme
              .headlineMedium,),
          const SizedBox(height: fSizes.sm,),
          Text(fTexts.loginSubTitle, style: Theme
              .of(context)
              .textTheme
              .bodyMedium), ]);
  }
}