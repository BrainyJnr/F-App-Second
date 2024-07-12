import 'package:f/common/widgets/appbar/appbar.dart';
import 'package:f/features/authentication/screens/home/update_name_controller.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:f/utilis/validators/Validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: fAppBar(showBackArrow: true,title: Text("Change Name",style: Theme.of(context).textTheme.titleLarge,),),

      body: Padding(
        padding: EdgeInsets.all(fSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text("Use name for any verification. This name will appear on several pages",
            style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: fSizes.spaceBtwSections,),

            /// Text field and Button
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) => fValidator.validateEmptyText("First Name", value),
                  expands: false,
                  decoration: InputDecoration(labelText: fTexts.firstName,prefixIcon: Icon(Iconsax.user)),
                ),
                SizedBox(height: fSizes.spaceBtwInputFields,),
                TextFormField(
                  controller: controller.lastName,
                  validator: (value) => fValidator.validateEmptyText("Last Name", value),
                  expands: false,
                  decoration: InputDecoration(labelText: fTexts.lastName,prefixIcon: Icon(Iconsax.user) ),

                )],
            )),
            const SizedBox(height: fSizes.spaceBtwSections,),

            /// Save Button
            SizedBox(width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(),child: Text("Save"),),
            )
          ],
        ),
      ),
    );
  }
}
