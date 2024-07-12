import 'package:f/features/personalization/controllers/address_controller.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/validators/Validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:f/utilis/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
        appBar: const fAppBar(
          showBackArrow: true,
          title: Text("Add new Address",

          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(fSizes.defaultSpace),
            child: Form(
              key: controller.addressFormKey,
              child: Column(children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => fValidator.validateEmptyText("Name", value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: "Name",
                      labelStyle: TextStyle(fontSize: fSizes.md)

                  ),
                ),
                const SizedBox(
                  height: fSizes.spaceBtwInputFields,
                ),
                TextFormField(
                    controller: controller.phoneNumber,
                    validator: (value) => fValidator.validateEmptyText("Phone Number", value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: "Phone Number",
                      labelStyle: TextStyle(fontSize: fSizes.md)

                  )
                ),
                const SizedBox(
                  height: fSizes.spaceBtwInputFields,
                ),
                Row(children: [
                  Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => fValidator.validateEmptyText("Street", value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building_31),
                        labelText: "Street",
                        labelStyle: TextStyle(fontSize: fSizes.md)

                    ),
                  )),
                  const SizedBox(
                    width: fSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => fValidator.validateEmptyText("Postal Code", value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.code),
                        labelText: "Postal Code",
                        labelStyle: TextStyle(fontSize: fSizes.md)

                    ),
                  )),
                ]),
                const SizedBox(height: fSizes.spaceBtwInputFields,),

                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                          controller: controller.city,
                          validator: (value) => fValidator.validateEmptyText("City", value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: "City",
                          labelStyle: TextStyle(fontSize: fSizes.md)

                      ),
                    )),
                    const SizedBox(
                      width: fSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                        child: TextFormField(
                            controller: controller.state,
                            validator: (value) => fValidator.validateEmptyText("State", value),
                      decoration:  InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: "State",
                      labelStyle: TextStyle(fontSize: fSizes.md)
                      )

                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: fSizes.spaceBtwInputFields,),
                    TextFormField(
                      controller: controller.country,
                      validator: (value) => fValidator.validateEmptyText("Country ", value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.global),
                          labelText: "Country",
                          labelStyle: TextStyle(fontSize: fSizes.md)

                      ),),
                      const SizedBox(height: fSizes.defaultSpace,),
                  SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => controller.addNewAddresses(),child: Text("Save"),)
                ),
              ]),
            ),
          ),
        ));
  }
}
