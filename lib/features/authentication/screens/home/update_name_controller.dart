import 'package:f/common/widgets/Managers/network_manager.dart';
import 'package:f/features/personalization/controllers/user_controller.dart';
import 'package:f/features/personalization/screens/profile/profile.dart';
import 'package:f/utilis/popUps/full_screen_loader.dart';
import 'package:f/utilis/popUps/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f/utilis/constants/image_strings.dart';

import '../../../../data/user/user_repository.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();


  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();


  /// Init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch User record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      fFullScreenLoader.openLoadingDialog(
          "We are updating your Information", fImages.Animation1);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        fFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        fFullScreenLoader.stopLoading();
        return;
      }

      // Update User`s first & last name in the Firebase FireStore
      Map<String, dynamic> name = {
        "FirstName": firstName.text.trim(),
        "LastName": lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      fFullScreenLoader.stopLoading();

      // Show Success Message
      fLoaders.successSnackBar(
          title: "Congratulations", message: "Your Name has been updated");

      // Move to previous screen.
      Get.offAll(() => ProfileScreen());
    } catch (e) {
      fFullScreenLoader.stopLoading();
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}