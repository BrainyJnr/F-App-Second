import 'package:f/common/widgets/appbar/appbar.dart';
import 'package:f/common/widgets/f_circular%20Images.dart';
import 'package:f/common/widgets/texts/success_heading.dart';
import 'package:f/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:f/utilis/constants/sizes.dart';

import '../../../authentication/screens/home/change_name.dart';
import '../../../authentication/screens/shimmer.dart';
import '../../controllers/user_controller.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: fAppBar(showBackArrow : true, title: Text( "Profile",)),
      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(fSizes.defaultSpace),
          child: Column(
            children: [
            /// Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(() {
                    final networkImage = controller.user.value.profilePicture;
                    final image = networkImage.isNotEmpty ? networkImage : fImages.CircleAvatar2;
                    return controller.imageUploading.value
                      ? const fShimmerEffect(width: 80, height: 80, radius: 80)
                     : fCircular_Images(image: image, width:80,height: 80, isNetworkImage: networkImage.isNotEmpty);
                  }),
                  TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text("Change Profile Picture")),
                ],
              ),
            ),
              /// Details
              const SizedBox(height: fSizes.spaceBtwItems / 2,),
              const Divider(),
              const SizedBox(height: fSizes.spaceBtwItems,),

              /// Heading Personal Info
              const fSectionHeading(title: "Profile Information",showActionButton: false,),
              const SizedBox(height: fSizes.spaceBtwItems,),

              fProfileMenu(onPressed: () => Get.to(() => ChangeName()), title: 'Name', value: controller.user.value.fullName,),
              fProfileMenu(onPressed: () {  }, title: 'Username', value: controller.user.value.username,),

              const SizedBox(height: fSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: fSizes.spaceBtwItems,),



              /// Heading Personal Info
              const fSectionHeading(title: "Personal Information",showActionButton: false,),
              const SizedBox(height: fSizes.spaceBtwItems,),


              fProfileMenu(title: 'User ID',value: controller.user.value.id,onPressed: () {  },icon: Iconsax.copy,),
              fProfileMenu(title: 'E-mail', value: controller.user.value.email,onPressed: () {  }, ),
              fProfileMenu(title: 'Phone Number',value: controller.user.value.phoneNumber,onPressed: () {  },  ),
              fProfileMenu(title: 'Gender', value: 'Male',onPressed: () {  },),
              fProfileMenu(title: 'Date of Birth', value: '14 Nov, 2005',onPressed: () {  }, ),
              const Divider(),
              const SizedBox(height: fSizes.spaceBtwItems,),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text("Close Account",style: TextStyle(color: Colors.red),),
                ),
              )



            ]
          ),
        ),
      ),
    );
  }
}

