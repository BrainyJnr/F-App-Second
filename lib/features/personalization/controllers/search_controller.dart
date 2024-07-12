import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

class SearchPage extends GetxController {
  final Rx<List<ProductModel>> _searchResults = Rx<List<ProductModel>>([]);

  List<ProductModel> get searchResults => _searchResults.value;

//    if (query.isEmpty) {
//       searchResults.clear();
//       return;
//     }

//    var result = await FirebaseFirestore.instance
//         .collection('Products')
//         .where('Title', isGreaterThanOrEqualTo: query)
//         .get();
  //var query = _searchResults.value.toLowerCase();
  search(String query) {
    if (query.isEmpty) {
      _searchResults.value = [];
      return;


    }
     String lowerCaseQuery = query.toLowerCase();
    _searchResults.bindStream(FirebaseFirestore.instance
        .collection("Products")
        .where("Title", isGreaterThanOrEqualTo: query.toUpperCase())
        //.where("Title", isGreaterThanOrEqualTo: lowerCaseQuery)
        .snapshots()
        .map((QuerySnapshot searchProduct) {
      List<ProductModel> searchList = [];
      for (var product in searchProduct.docs) {
        searchList.add(ProductModel.fromQuerySnapshot(product));
      }

      return searchList;
    }));



  }
}
