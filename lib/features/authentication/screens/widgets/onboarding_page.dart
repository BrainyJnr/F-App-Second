import 'package:flutter/material.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:f/utilis/constants/sizes.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({
    super.key, required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(padding:  EdgeInsets.all(fSizes.defaultSpace),
        child:   Column(
          children: [
            Image(
                width: fHelperFunctions.screenWidth() * 0.8,
                height: fHelperFunctions.screenHeight() * 0.6,
                image: AssetImage(image)),
            Text(title,style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: fSizes.spaceBtwItems,),
            Text(subtitle,style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,)
          ],
        )

    );
  }
}