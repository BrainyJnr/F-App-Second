import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/features/personalization/screens/all_products/all_products.dart';
import 'package:f/utilis/exceptions/firebase_exceptions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class DataController extends GetxController {
  static DataController get instance => Get.find();
  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
    await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }
   Future queryData(String queryString) async {
    return FirebaseFirestore.instance.collection("Products").where(
      "Title",isGreaterThanOrEqualTo: queryString
    ).get();

    // @override
    //     void onClose() {}
    //     void filterProducts(String ProductsName) {
    //       List<Map<String, dynamic>> results = [];
    //       if (ProductsName.isEmpty) {
    //         results = Products;
    //       } else {
    //         results = Products.where()
    //       }
    //     }
  }
}
