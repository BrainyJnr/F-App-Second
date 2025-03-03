import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controllers.onboarding/oonboarding.controller.dart';
import '../widgets/onboarding_dot_navigation.dart';
import '../widgets/onboarding_next_button.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
     body: Stack(
       children: [
         PageView(
           controller: controller.pageController,
           onPageChanged: controller.updatePageIndicator,
           children: [
             onBoardingPage(
               image: fImages.onBoardingImage1,
               title: fTexts.onBoardingTitle1,
               subtitle: fTexts.onBoardingSubTitle1,),
             onBoardingPage(
               image: fImages.onBoardingImage2,
               title: fTexts.onBoardingTitle2,
               subtitle: fTexts.onBoardingSubTitle2,),
             onBoardingPage(
               image: fImages.onBoardingImage3,
               title: fTexts.onBoardingTitle3,
               subtitle: fTexts.onBoardingSubTitle3,)

           ]),

         /// Skip Button
        const OnBoardingSkip(),

         /// Dot Navigation SmoothPageIndicator
        const onBoardingDotNavigation(),

         /// Circular Button
      const   onboarding_Next_Button(),
       ]
     ),
    );
  }
}








