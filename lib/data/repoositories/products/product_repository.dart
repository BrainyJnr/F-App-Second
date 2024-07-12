import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/utilis/exceptions/firebase_exceptions.dart';
import 'package:f/utilis/exceptions/firebase_storage_service.dart';
import 'package:f/utilis/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shops/models/product_model.dart';
import '../../../utilis/constants/enums.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();


  /// FireStore instance for database interactions.
  final _db = FirebaseFirestore.instance;


  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection("Products").where("IsFeatured", isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw "shddddddddd $e";
    } on PlatformException catch (e) {
      throw "eeeeeeeeeeeeeee";
    } catch (e) {

      throw "mmmmmmmmm$e";

    }
  }

  /// Get limited featured products
  //Future<List<ProductModel>> getAllFeaturedProducts() async {
    Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _db.collection("Products").get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw "yyyyyyyyyyyyyyy";
    } on PlatformException catch (e) {
      throw "oooooooooooooooo";
    } catch (e) {

      throw "mmmmmmmmm$e";

    }
  }



  /// Get Products based on the Query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch (e) {
      throw "pppppppppppppppppp";
    } on PlatformException catch (e) {
      throw "nnnnnnnnnnnnnnnnnnnn";
    } catch (e) {

      throw "wwwwwwwww$e";

    }
  }


  /// Get Products based on the Query
  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      final snapshot = await _db.collection("Products").where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
    } on FirebaseException catch (e) {
      throw "aaaaaaaaaaaaaaaaaaaaaa";
    } on PlatformException catch (e) {
      throw "vvvvvvvvvvvvvvvvvvv";
    } catch (e) {

      throw "wwwww$e";

    }
  }



  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
    try{
      final querySnapshot = limit == -1
     ? await _db.collection("Products").where("Brand.Id", isEqualTo: brandId).get()
     : await _db.collection("Products").where("Brand.Id", isEqualTo: brandId).limit(limit).get();

       final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

       return products;
    } on FirebaseException catch (e) {
      throw "lllllllllllllllllll";
    } on PlatformException catch (e) {
      throw "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
    } catch (e) {
      throw "xxxxxxxxx$e";

    }
  }

  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4}) async {
    try{
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db.collection("ProductCategory").where("categoryId", isEqualTo: categoryId).get()
          : await _db.collection("ProductCategory").where("categoryId", isEqualTo: categoryId).limit(limit).get();

      List<String> productIds = productCategoryQuery.docs.map((doc) => doc["productId"] as String).toList();

      final productsQuery = await _db.collection("Products").where(FieldPath.documentId,whereIn: productIds).get();

      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();


      return products;
    } on FirebaseException catch (e) {
      throw "jjjjjjjjjjjjjjjjjjjjjj";
    } on PlatformException catch (e) {
      throw "qqqqqqqqqqqqqqqqqq";
    } catch (e) {
      throw "xxxxx$e";

    }
  }



  /// Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Upload all the products along their images
      final storage = Get.put(fFirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        //Get image data link from local assets
        final thumbnail = await storage.getImageDataFromAssets(
            product.thumbnail);

        // Upload image URL to product.thumbnail attribute
        final url = await storage.uploadImageData(
            "Products/Images", thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumbnail attribute
        product.thumbnail = url;

        // Product list of Images
//        if (product.images != null && product.images!.isNotEmpty) {
//           List<String> imageUrl = [];
//           for (var image in product.images!) {
//             // Get image data link from local assets
//             final assetImage = await storage.getImageDataFromAssets(image);
//
//             // Upload image and get its URL
//             final url = await storage.uploadImageData(
//                 "Products/Images", assetImage, image);
//
//             // Assign URL to product.thumbnail attribute
//             imageUrl.add(url);
//           }
//           product.images!.clear();
//           product.images!.addAll(imageUrl);
//         }
        // Upload Variables Images
        if(product.productType == ProductType.variable.toString()) {
          for(var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // Upload image and get its URL
            final url = await storage.uploadImageData("Products/Images", assetImage, variation.image);

            // Assign URL to variation.image attribute
            variation.image = url;
          }
        }

        // Store product in FireStore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e){
      throw e.message!;
    } catch (e) {
      throw "ooooooo$e";
    }
  }

}