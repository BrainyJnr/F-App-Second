import 'package:f/features/personalization/controllers/address_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/authentication/models/address_model.dart';
import 'authentication_repository.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
 // final List   AddressController.obs;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId
          .isEmpty) throw "Unable to find user information. Try again in few minutes.";

      final result = await _db.collection("Users").doc(userId).collection("Addresses").get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();

    } catch (e) {
      throw "Something went wrong while fetching Address Information. Try again later";

    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async {
    try{
      final userId = AuthenticationRepository. instance.authUser!.uid;
      await _db.collection("Users").doc(userId).collection("Addresses").doc(addressId).update({"SelectedAddress": selected});

    } catch (e) {
      throw "Unable to update your address selection. Try again later.";
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAddress = await _db.collection("Users")
          .doc(userId)
          .collection("Addresses")
          .add(address.toJson());
      return currentAddress.id;
    } catch  (e) {
      throw "S/W/S/A";
    }}}