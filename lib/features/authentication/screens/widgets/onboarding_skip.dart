import 'package:f/features/authentication/controllers.onboarding/oonboarding.controller.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/device/device_utility.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: fDeviceUtilis.getAppBarHeight(),
        right: fSizes.defaultSpace,
        child: TextButton(onPressed: ()=> OnBoardingController.instance.skipPage(),
          child: const Text("Skip"),));
  }
}