import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/features/shops/models/product_attribute_model.dart';
import 'package:f/features/shops/models/product_variation_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilis/formatters/formatters.dart';
import 'brand_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  int? soldQuantity;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.soldQuantity = 0,
    //required this.salePrice,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  String get formattedDate => fFormatter.formatDate(date);
  static ProductModel empty() => ProductModel(
    id: "",
    title: "",
    stock: 0,
    price: 0,
    thumbnail: "",
    productType: "",
  );

  /// Json Format
  toJson() {
    return {
      "SKU": sku,
      "Title": title,
      "Stock": stock,
      "Price": price,
      "Images": images ?? [],
      "Thumbnail": thumbnail,
      "SalePrice": salePrice,
      "soldQuantity": soldQuantity,
      "IsFeatured": isFeatured,
      "CategoryId": categoryId,
      "Brand": brand!.toJson(),
      "Description": description,
      "ProductType": productType,
      "ProductAttributes": productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      "ProductVariations": productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;

    return ProductModel(
      id: document.id,
      sku: data["SKU"] ?? "",
      title: data["Title"] ?? "",
      stock: data["Stock"] ?? 0,
      isFeatured: data["IsFeatured"] ?? false,
      price: double.parse((data["Price"] ?? 0.0).toString()),
      salePrice: double.parse((data["SalePrice"] ?? 0.0).toString()),
      thumbnail: data["Thumbnail"] ?? "",
      categoryId: data["CategoryId"] ?? "",
      description: data["Description"] ?? "",
      productType: data["ProductType"] ?? "",
      brand: data["Brand"] != null ? BrandModel.fromJson(data["Brand"]) : null,
      images: data["Images"] != null ? List<String>.from(data["Images"]) : [], // ✅ Prevent null error
      soldQuantity: data.containsKey("SoldQuantity") ? data["SoldQuantity"] ?? 0 : 0,
      productAttributes: data["ProductAttributes"] != null
          ? (data["ProductAttributes"] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList()
          : [], // ✅ Prevent null error
      productVariations: data["ProductVariations"] != null
          ? (data["ProductVariations"] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList()
          : [], // ✅ Prevent null error
    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      sku: data["SKU"] ?? "",
      title: data["Title"] ?? "",
      stock: data["Stock"] ?? "",
      isFeatured: data["IsFeatured"] ?? false,
      price: double.parse((data["Price"] ?? 0.0).toString()),
      soldQuantity: data.containsKey("SoldQuantity") ? data["SoldQuantity"] ?? 0 : 0,
      salePrice: double.parse((data["SalePrice"] ?? 0.0).toString()),
      thumbnail: data["Thumbnail"] ?? "",
      categoryId: data["CategoryId"] ?? "",
      description: data["Description"] ?? "",
      productType: data["ProductType"] ?? "",
      brand: BrandModel.fromJson(data["Brand"]),
      images: data["Images"] != null ? List<String>.from(data["Images"]) : [],
      productAttributes: (data["ProductAttributes"] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data["ProductVariations"] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),


    );
  }
}