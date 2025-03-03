import 'package:f/features/authentication/login/logn_controller.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class fSocialButtons extends StatelessWidget {
  const fSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: fColors.grey), borderRadius:BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
                width: fSizes.iconMd,
                height: fSizes.iconMd,
                image: NetworkImage(fImages.google)),
          ),
        ),
        const SizedBox(width: fSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(border: Border.all(color: fColors.grey), borderRadius:BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
                width: fSizes.iconMd,
                height: fSizes.iconMd,
                image: NetworkImage(fImages.facebook)),
          ),
        ),
      ],
    );
  }
}