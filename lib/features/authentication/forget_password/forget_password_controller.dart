import 'package:f/common/widgets/Managers/network_manager.dart';
import 'package:f/data/repoositories/authentication_repository.dart';
import 'package:f/features/authentication/password_configuration/reset_password.dart';
import 'package:f/utilis/popUps/full_screen_loader.dart';
import 'package:f/utilis/popUps/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:f/utilis/constants/image_strings.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      fFullScreenLoader.openLoadingDialog(
          "Processing your request...", fImages.Animation1);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        fFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        fFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(
          email.text.trim());

      // Remove Loader
      fFullScreenLoader.stopLoading();

      // Show Success Screen
      fLoaders.successSnackBar(title: "Email Sent,",
          message: "Email Link Sent to Reset your Password".tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      fFullScreenLoader.stopLoading();
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }


  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      fFullScreenLoader.openLoadingDialog(
          "Processing your request...", fImages.Animation1);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        fFullScreenLoader.stopLoading();
        return;
      }


      await AuthenticationRepository.instance.sendPasswordResetEmail(
          email);

      // Remove Loader
      fFullScreenLoader.stopLoading();

      // Show Success Screen
      fLoaders.successSnackBar(title: "Email Sent,",
          message: "Email Link Sent to Reset your Password".tr);

    } catch (e) {
      // Remove Loader
      fFullScreenLoader.stopLoading();
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}

