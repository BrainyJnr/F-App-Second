import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/features/shops/models/brand_model.dart';
import 'package:f/utilis/exceptions/firebase_exceptions.dart';
import 'package:f/utilis/exceptions/format_exceptions.dart';
import 'package:f/utilis/exceptions/platform_exceptions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();


  /// Variables
  final _db = FirebaseFirestore.instance;


  /// Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try{

      final snapshot = await _db.collection("Brands").get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;

    } on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const fFormatException();
    } on PlatformException catch (e) {
      throw fPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }


  /// Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try{
      QuerySnapshot brandCategoryQuery = await _db.collection
        ("BrandCategory").where("categoryId",isEqualTo: categoryId).get();

      // Extract brandIds from the documents
      List <String> brandIds = brandCategoryQuery.docs.map((doc) => doc ["brandId"] as String).toList();

      final brandsQuery = await _db.collection("Brands").where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;

    } on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const fFormatException();
    } on PlatformException catch (e) {
      throw fPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

}