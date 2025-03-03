import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/features/shops/models/brand_model.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:f/utilis/exceptions/firebase_storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'features/shops/models/banner_model.dart';

class dummyRepository extends GetxController {
 //class FirebaseService {

  final _db = FirebaseFirestore.instance;
 //  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


 // Future<void> uploaddummydata(List<BannerModel> banners) async {
   Future<void> uploadDummydata(List<ProductModel> products) async {

    try {

      final storage = Get.put(fFirebaseStorageService());

      for (var item in products) {
        final file = await storage.getImageDataFromAssets(item.thumbnail);

        //final url = await storage.uploadImageData("Banners", file, item.targetScreen);
        final url = await storage.uploadImageData("Products", file, item.title );

        item.thumbnail = url;

        await _db.collection("Products").doc(item.id).set(item.toJson());
      }
    } on FirebaseException catch (e) {
      throw "========$e=======here" ;
    } on PlatformException catch (e) {
      throw "===========$e=====================";
    } catch (e) {
      throw "Something went wrong $e";
    }
  }}


//  Future<void> uploaddummydata(List<CategoryModel> cats) async {
//      try {
//        final storage = Get.put(fFirebaseStorageService());
//
//        for(var item in cats) {
//          final file = await storage.getImageDataFromAssets(item.image);
//
//          final url = await storage.uploadImageData("category", file, item.name);
//
//
//          item.image = url;
//
//
//          await _db.collection("category").doc(item.id).set(item.toJson());
//        }
//      } on FirebaseException catch (e) {
//        throw "dfuhsjkddddddd $e";
//      } on PlatformException catch (e) {
//        throw "diskjhdushijhif $e";
//      } catch (e) {
//        throw "something scfhdhhshhdajj $e";
//      }
//
//    }