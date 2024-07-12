import 'package:f/features/authentication/controllers.onboarding/oonboarding.controller.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/device/device_utility.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';


class onboarding_Next_Button extends StatelessWidget {
  const onboarding_Next_Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Positioned(
        right: fSizes.defaultSpace,
        bottom: fDeviceUtilis.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape:  CircleBorder(),backgroundColor: dark? fColors.primary : Colors.black),
          onPressed: ()=> OnBoardingController.instance.nextPage(),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}