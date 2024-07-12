import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/data/repoositories/authentication_repository.dart';
import 'package:f/data/user/user_model.dart';
import 'package:f/utilis/exceptions/firebase_exceptions.dart';
import 'package:f/utilis/exceptions/format_exceptions.dart';
import 'package:f/utilis/exceptions/platform_exceptions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;




  /// Function to save user data to FireStore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    }on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    }on FormatException catch(_) {
      throw const fFormatException();
    }on PlatformException catch(e) {
      throw fPlatformException(e.code).message;
    }catch (e){
      throw "Something went wrong. Please try again";
    }
  }

  /// Function to fetch details based on User ID.
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const fFormatException ();
    } on PlatformException catch (e) {
      throw fPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Function to update user data on FireStore.
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db.collection("Users").doc(updateUser.id).update(updateUser.toJson());
    }on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    }on FormatException catch(_) {
      throw const fFormatException();
    }on PlatformException catch(e) {
      throw fPlatformException(e.code).message;
    }catch (e){
      throw "Something went wrong. Please try again";
    }
  }

  /// Update any field in specific Users Collection.
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    }on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    }on FormatException catch(_) {
      throw const fFormatException();
    }on PlatformException catch(e) {
      throw fPlatformException(e.code).message;
    }catch (e){
      throw "Something went wrong. Please try again";
    }
  }

  /// Function to remove user data from FireStore.
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    }on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    }on FormatException catch(_) {
      throw const fFormatException();
    }on PlatformException catch(e) {
      throw fPlatformException(e.code).message;
    }catch (e){
      throw "Something went wrong. Please try again";
    }
  }

  /// Upload any Image.
   Future<String> uploadImage(String path, XFile image) async {
     try{
       final ref = FirebaseStorage.instance.ref(path).child(image.name);
       await ref.putFile(File(image.path));
       final url = await ref.getDownloadURL();
       return url;
     } on FirebaseException catch (e) {
       throw fFirebaseException(e.code).message;
     } on FormatException catch(_) {
       throw const fFormatException();
     } on PlatformException catch(e) {
       throw fPlatformException(e.code).message;
     } catch (e) {
       throw "Something went wrong. Please try again";
     }
   }
   }
