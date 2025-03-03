import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String id;
  String name;
  bool isFeatured;

  final String targetScreen;
  bool active;

  BannerModel({
    required this.name,
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
    required this.isFeatured,
    required this.id,
  });

  static BannerModel empty() => BannerModel(
      imageUrl: "",
      targetScreen: "",
      active: false,
      id: '',
      name: '',
      isFeatured: false);

  Map<String, dynamic> toJson() {
    return {
      "ImageUrl": imageUrl,
      "TargetScreen": targetScreen,
      "Active": active,
      "Name": name,
      "IsFeatured": isFeatured,
    };
  }

//  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
//     final data = snapshot.data() as Map<String, dynamic>;
//     return BannerModel(
//       id: document.id,
//
//       imageUrl: data["ImageUrl"] ?? "",
//       targetScreen: data["TargetScreen"] ?? "",
//       active: data["Active"] ?? false,
//     );
//   }}

  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

// Map JSON Record to the Model
      return BannerModel(
        id: document.id,
        name: data["Name"],
        imageUrl: data["ImageUrl"] ?? "",
        targetScreen: data["TargetScreen"] ?? "",
        active: data["Active"] ?? false,
        isFeatured: data["IsFeatured"] ?? false,
      );
    } else {
      return BannerModel.empty();
    }
  }
}
