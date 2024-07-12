import 'package:f/data/repoositories/authentication_repository.dart';
import 'package:f/data/user/user_repository.dart';
import 'package:f/features/authentication/screens/signup/sign_widget/verify_email.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/popUps/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../common/widgets/Managers/network_manager.dart';
import '../../../../../data/user/user_model.dart';
import '../../../../../utilis/popUps/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- SIGNUP
  void signup() async {
    try {
      // Start Loading
      fFullScreenLoader.openLoadingDialog(
          "We are processing your information...", fImages.Animation1,);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        fFullScreenLoader.stopLoading();
        return;
      }
        // Form Validation
        if (!signupFormKey.currentState!.validate()) {
          // Remove Loader
          fFullScreenLoader.stopLoading();

          return;
        }

        // Privacy Policy Check
        if (!privacyPolicy.value) {
          fLoaders.warningSnackBar(
              title: "Accept Privacy Policy",
              message:
              "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.");
          return;
        }

        // Register user in the Firebase Authentication & Save user data in the Firebase
        final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
            email.text.trim(), password.text.trim());

        // Save Authenticated user data in the FireStore
        final newUser = UserModel (

          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: "",
        );

        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(newUser);

        // Remove Loader
      fFullScreenLoader.stopLoading();

        // Show Success Message
        fLoaders.successSnackBar(title: "Congratulations", message: "Your account has been created Verify email to continue.");

        // Move to Verify Email Screen
        Get.to(()=> VerifyEmailScreen(email: email.text.trim(),));

    } catch (e) {
      // Remove Loader
      fFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      fLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      // Remove Loader
    }
  }
}
