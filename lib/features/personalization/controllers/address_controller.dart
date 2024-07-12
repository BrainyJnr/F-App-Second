import 'package:f/common/widgets/Managers/network_manager.dart';
import 'package:f/common/widgets/texts/success_heading.dart';
import 'package:f/features/personalization/screens/address/add_new_address.dart';
import 'package:f/features/personalization/screens/address/widgets/single-address.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/cloud_helper_functions.dart';
import 'package:f/utilis/popUps/full_screen_loader.dart';
import 'package:f/utilis/popUps/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../data/repoositories/address_repository.dart';
import '../../authentication/models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final Rx<AddressModel> AddNewAddressScreen = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());
  final Rx<AddressModel> newSelectedAddress = AddressModel.empty().obs;



  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value =
          addresses.firstWhere((element) => element.selectedAddress,
              orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      fLoaders.errorSnackBar(title: "Address not found", message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: "",
          onWillPop: () async {return false;},
      barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: CircularProgressIndicator(),



      );
      // Clear the "selected" field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, true);
      }

      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the "Selected" field to true for the newly selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);
      CircularProgressIndicator();

      Get.back();
    } catch (e) {
      fLoaders.errorSnackBar(
          title: "Error in Selection", message: e.toString());
    }
  }

  /// Add new Address
  Future addNewAddresses() async {
    try {
    fFullScreenLoader.openLoadingDialog(
        "Storing Address...", fImages.animalIcon);

    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      fFullScreenLoader.stopLoading();
      return;
    }

    // Form Validation
    if (!addressFormKey.currentState!.validate()) {
      fFullScreenLoader.stopLoading();
      return;
    }

    // Save Address Data
    final address = AddressModel(
      id: "",
      name: name.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      street: street.text.trim(),
      city: city.text.trim(),
      state: state.text.trim(),
      postalCode: postalCode.text.trim(),
      country: country.text.trim(),
      selectedAddress: true,
    );
    final id = await addressRepository.addAddress(address);

    address.id = id;
    await selectedAddress(address);

    fFullScreenLoader.stopLoading();

    fLoaders.successSnackBar(title: "Congratulations mannnnnnn",
        message: "Yup... Your address has been saved successfully.");

    refreshData.toggle();

    resetFormFields();

    Navigator.of(Get.context!).pop();
  } catch (e) {

    fFullScreenLoader.stopLoading();
    fLoaders.errorSnackBar(title: "Address not found", message: e.toString());



  }
}

  /// Show Address ModalBottomSheet of Checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) =>
            //SingleChildScrollView(
                  //child: Container(
                 Padding(  padding: EdgeInsets.all(fSizes.lg),
                   //  child: Column(
                    //children: [
                     // fSectionHeading(title: "Select Address",showActionButton: false),
                    child:   FutureBuilder(
                          future: getAllUserAddresses(),
                          builder: (_, snapshot) {
                            final response = fCloudHelperFunctions
                                .checkMultiRecordState(snapshot: snapshot);
                            if (response != null) return response;

                            return
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) =>
                                    fSingleAddress(
                                      address: snapshot.data![index],
                                      onTap: () async {
                                        await selectAddress(
                                            snapshot.data![index]);
                                        Get.back();
                                      },
                                    ),
                              );
                          } )


                    //  SizedBox(height: fSizes.defaultSpace *2,),
                     // SizedBox(
                       // width: double.infinity,
                      //child: ElevatedButton(onPressed: () => Get.to(() => AddNewAddressScreen()),child: Text("Add new Address"),),



    ));
  }







 void resetFormFields() {
   name.clear();
   phoneNumber.clear();
   street.clear();
   postalCode.clear();
   city.clear();
   state.clear();
   country.clear();
   addressFormKey.currentState?.reset();
 } }

















