import 'package:f/features/personalization/controllers/address_controller.dart';
import 'package:f/features/personalization/screens/address/widgets/single-address.dart';
import 'package:f/utilis/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:f/common/widgets/appbar/appbar.dart';
import 'package:f/utilis/constants/sizes.dart';

import 'package:f/utilis/constants/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../authentication/models/address_model.dart';
import 'add_new_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

    return Scaffold(
        appBar: fAppBar(
          showBackArrow: true,
          title: Text(
            "Addresses",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(fSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  final response = fCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot);
                  if (response != null) return response;
                  final addresses = snapshot.data!;

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (_, index) => fSingleAddress(
                            address: addresses[index],
                            onTap: ()  async {
                              CircularProgressIndicator();

                            await  controller.selectAddress(addresses[index]);

                              Get.back();
                            }  ));
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: fColors.primary,
          onPressed: () => Get.to(() => const AddNewAddressScreen()),
          child: const Icon(
            Iconsax.add,
            color: fColors.white,
          ),
        ));
  }
}
