import 'package:f/features/authentication/controllers.onboarding/oonboarding.controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/device/device_utility.dart';
import 'package:f/utilis/helpers/helper_functions.dart';



class onBoardingDotNavigation extends StatelessWidget {
  const onBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = fHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: fDeviceUtilis.getBottomNavigationBarHeight() +25,
        left: fSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          count: 3,
          onDotClicked: controller.dotNavigationClick,
          effect:  ExpandingDotsEffect(activeDotColor:dark? fColors.light:  fColors.dark,dotHeight: 6 ),
        )
    );
  }
}