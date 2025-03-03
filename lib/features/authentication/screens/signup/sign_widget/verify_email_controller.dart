import 'dart:async';

import 'package:f/common/widgets/success_screen/success_screen.dart';
import 'package:f/data/repoositories/authentication_repository.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:f/utilis/popUps/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      fLoaders.successSnackBar(
          title: "Email Sent",
          message: "Please Check your inbox and verify your email");
    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Timer to automatically redirect an Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: fImages.EmailImage3,
            title: fTexts.youraccountcreatedTitle,
            subTitle: fTexts.youraccountcreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  /// Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: fImages.EmailImage3,
          title: fTexts.youraccountcreatedTitle,
          subTitle: fTexts.youraccountcreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
