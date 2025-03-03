import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    this.isFeatured,
    this.productsCount,
  });

  static BrandModel empty() => BrandModel(
     id: "",
      image: "", name: "");

  /// Convert model to Json structure so that you can store data in Firebase
  toJson() {
    return {
      "Id": id,
      "Name": name,
      "Image": image,
      "ProductCount": productsCount,
     "IsFeatured": isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data["Id"] ?? "",
      image: data["Name"] ?? "",
      name: data["Image"] ?? "",
     isFeatured: data["IsFeatured"] ?? false,
      productsCount: int.parse((data["ProductsCount"] ?? 0).toString()),
    );
  }

  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return BrandModel(
        id: document.id,
        image: data["Image"] ?? "",
        name: data["Name"] ?? "",
        isFeatured: data["IsFeatured"] ?? false,
       productsCount: int.parse((data["ProductsCount"] ?? 0).toString()),
       //productsCount: data["ProductsCount"] ?? "",
      );
    } else {
      return BrandModel.empty();
    }
  }
}
