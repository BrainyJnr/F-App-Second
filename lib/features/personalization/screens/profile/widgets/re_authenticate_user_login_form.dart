import 'package:f/common/widgets/appbar/appbar.dart';
import 'package:f/features/personalization/controllers/user_controller.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:f/utilis/validators/Validation.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: fAppBar(
        title: Text("Re-Authenticate User"),showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(fSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: fValidator.validateEmail,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: fTexts.email),
                ),
                const SizedBox(
                  height: fSizes.spaceBtwInputFields,
                ),

                /// Password
                Obx(() => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        fValidator.validateEmptyText("Password", value),
                    decoration: InputDecoration(
                      labelText: fTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                        icon: Icon(Iconsax.eye_slash),
                      )
                    ),)),
                const SizedBox(height: fSizes.spaceBtwSections,),

                /// LOGIN Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: ()=> controller.reAuthenticateEmailAndPasswordUser(),child: Text ("Verify"),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
