import 'package:cached_network_image/cached_network_image.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getAllProductImages(ProductModel product) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(product.thumbnail);

    /// Assign Thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;

    // Get all images from the Product Model if not null.
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // Get all images from the Product Variation if not null.
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }


  /// -- Show Image PopUp
  void showEnlargeImage(String image) {
    Get.to(
        fullscreenDialog: true,
        ()
    =>
        Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: fSizes.defaultSpace * 2, horizontal: fSizes.defaultSpace),
                child: CachedNetworkImage(imageUrl: image,),
              ),
              const SizedBox(height: fSizes.defaultSpace),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 350,
                  child: OutlinedButton(onPressed: () => Get.back(),child: Text("Close",style: TextStyle(
                    color: Colors.black
                  ),),),
                ),
              )
            ],
          ),
        )
    );
  }
}

