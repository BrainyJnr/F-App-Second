import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utilis/exceptions/firebase_auth_exceptions.dart';
import '../../../../utilis/exceptions/firebase_exceptions.dart';
import '../../../../utilis/exceptions/format_exceptions.dart';
import '../../../../utilis/exceptions/platform_exceptions.dart';
import '../model/settings_model.dart';

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  final _settingsRepo = SettingsRepository.instance;

  RxDouble shippingCost = 0.0.obs;
  RxDouble taxRate = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSettings();
  }

  /// Fetch Settings from Firestore
  Future<void> fetchSettings() async {
    try {
      final settings = await _settingsRepo.getSettings();
      shippingCost.value = settings.shippingCost;
      taxRate.value = settings.taxRate;
    } catch (e) {
      print("Error fetching settings: $e");
    }
  }
}


class SettingsRepository extends GetxController {
  static SettingsRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save settings data to Firestore
  Future<void> registerSettings(SettingsModel setting) async {
    try {
      await _db.collection("Settings").doc("GLOBAL_SETTINGS").set(setting.toJson());
    } on FirebaseAuthException catch (e) {
      throw fFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw fFormatException();
    } on PlatformException catch (e) {
      throw fPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Function to fetch setting details based on setting ID
  Future<SettingsModel> getSettings() async {
    try {
      final querySnapshot = await _db.collection("Settings").doc("GLOBAL_SETTINGS").get();
      return SettingsModel.fromSnapshot(querySnapshot);
    } on FirebaseAuthException catch (e) {
      throw fFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw fFormatException();
    } on PlatformException catch (e) {
      throw fPlatformException(e.code).message;
    } catch (e) {
      if(kDebugMode) print("Something went wrong: $e");
      throw "Something went wrong. Please try again: $e";
    }
  }

  /// Function to update setting data in Firestore
  Future<void> updateSettingDetails(SettingsModel updatedSetting) async {
    try {
      await _db.collection("Settings").doc("GLOBAL_SETTINGS").update(updatedSetting.toJson());
    } on FirebaseAuthException catch (e) {
      throw fFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw fFormatException();
    } on PlatformException catch (e) {
      throw fPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Update any field in specific Setting Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Settings").doc("GLOBAL_SETTINGS").update(json);
    } on FirebaseAuthException catch (e) {
      throw fFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw fFormatException();
    } on PlatformException catch (e) {
      throw fPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}