import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/data/repoositories/authentication_repository.dart';
import 'package:get/get.dart';

import '../../features/shops/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /* -------------------------- FUNCTIONS------------------------*/

  /// Get  all order related to current User
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userid = AuthenticationRepository.instance.authUser.uid;
      if (userid.isEmpty) {
        throw "Unable to find user information. Try again in a few minutes.";
      }

      final result = await _db
          .collection("Orders")
          .where("userid", isEqualTo: userid)
          .get();

      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw "Something went wrong while fetching Order Information. $e";
    }
  }

  Future<void> saveOrder(OrderModel order) async {
    try {
      await _db.collection("Orders").add(order.toJson());
    } catch (e) {
      throw "Something went wrong while saving Order Information. Try again later.";
    }
  }
}

