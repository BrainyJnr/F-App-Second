import 'package:f/features/shops/models/product_model.dart';
import 'package:f/features/shops/models/product_variation_model.dart';
import 'package:f/utilis/constants/enums.dart';
import 'package:f/utilis/popUps/loaders.dart';
import 'package:get/get.dart';

import '../../../personalization/controllers/cart_controller.dart';
import 'image_controller.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();


  /// Variables
  RxMap selectedAttributes = {}.obs;
  Rx<String> variationStockStatus = "".obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;


  /// --- Select Attribute, and Variation
  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    // When attribute is selected we will first add that attribute to the selectedAttributes
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
          (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
    orElse: () => ProductVariationModel.empty(),
    );

    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value = selectedVariation.image;
    }

    // Show the selected Variation image as a Main Image
    if(selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    // Assign Selected variation
    this.selectedVariation.value = selectedVariation;

    // Update selected product variation status
    getProductVariationStockStatus();
  }

  /// --- Check if selected attribute matches any variation attribute
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    if(variationAttributes.length!= selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if(variationAttributes[key] != selectedAttributes[key]) return false;
    }


    return true;
  }

  /// --- Check Attribute availability / Stock in Variation
  Set<String?> getAttributeAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations.where((variation) => variation.attributeValues[attributeName] !=
    null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
    // Fetch all non-empty attributes of variations
    .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;

  }

  String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  /// --- Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? "In Stock" : "Out of Stock";
  }

  /// --- Reset Selected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
   variationStockStatus.value = "";
    selectedVariation.value = ProductVariationModel.empty();
  }
}