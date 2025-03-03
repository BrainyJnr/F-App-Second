import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/features/shops/models/banner_model.dart';
import 'package:f/utilis/exceptions/firebase_exceptions.dart';
import 'package:f/utilis/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utilis/exceptions/format_exceptions.dart';


class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection("banners").where(
          "Active", isEqualTo: true).get();
      return result.docs.map((documentSnapshot) =>
          BannerModel.fromSnapshot(documentSnapshot)).toList();

    } on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const fFormatException();
    } on PlatformException catch (e) {
      throw fPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong while fetching Banners. $e";
    }
  }


/// Upload Banners to the Cloud Firebase
///  Future<void> uploadDummyData(List<BannerModel> banners) async {
//     try {
//       // upload all the Categories along with their Images
//       final storage = Get.put(fFirebaseStorageService());
//
//       // Loop through each category
//       for (var banner in banners) {
//         // Get ImageData line from the local assets
//         final file = await storage.getImageDataFromAssets(banner.imageUrl);
//
//         // Upload Image and Get Its URL
//         final url = await storage.uploadImageData("Banner", file, banner.targetScreen);
//
//         // Assign URL to Category image attribute
//         banner.imageUrl = url;
//
//         // Store Category in FireStore
//         await _db.collection("Banner").where("Active,isEqualto = true").where(banner.imageUrl).get(banner.toJson() as GetOptions?);
//       }
//     } on FirebaseException catch (e) {
//       throw fFirebaseException(e.code).message;
//     } on PlatformException catch  (e) {
//       throw fPlatformException(e.code).message;
//     } catch (e) {
//       throw "Something went wrong. Please try again";
//     }
//   }}
}