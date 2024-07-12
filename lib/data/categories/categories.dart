import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/features/shops/models/category_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utilis/exceptions/firebase_exceptions.dart';
import '../../utilis/exceptions/firebase_storage_service.dart';
import '../../utilis/exceptions/format_exceptions.dart';
import '../../utilis/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("category").get();
      final list = snapshot.docs.map((document) =>
          CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw fPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again. $e";
    }
  }


  /// Get Sub Categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {

      final snapshot = await _db.collection("category").where("ParentId",isEqualTo: categoryId).get();
      final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;

    } on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw fPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // upload all the Categories along with their Images
      final storage = Get.put(fFirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData line from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload Image and Get Its URL
        final url = await storage.uploadImageData("Categories", file, category.name);

        // Assign URL to Category image attribute
        category.image = url;

        // Store Category in FireStore
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    } on PlatformException catch  (e) {
      throw fPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}