import 'package:f/features/shops/controllers/products/variation_controller.dart';
import 'package:f/features/shops/models/category_model.dart';
import 'package:f/utilis/local%20storage/storage_utilis.dart';
import 'package:f/utilis/popUps/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilis/constants/enums.dart';
import '../../shops/models/product_model.dart';
import '../models/cart_item_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  // Add items in the cart
//  void addToCart(ProductModel product) {
//     // Quantity Check
//     if (productQuantityInCart.value < 1) {
//       fLoaders.customToast(message: "Select Quantity");
//       return;
//     }
//
//
//     // Variation Selected?
//     if (product.productType == ProductType.variable.toString() &&
//         variationController.selectedVariation.value.id.isEmpty) {
//       fLoaders.customToast(message: "Select Variation");
//       return;
//     }
//     // Out of Stock Status
//     if (product.productType == ProductType.variable.toString()) {
//       if (variationController.selectedVariation.value.stock < 1) {
//         fLoaders.warningSnackBar(
//             message: "Selected variation is out of stock mannnn",
//             title: "Oh Snap!");
//         return;
//       }
//     } else {
//       if (product.stock < 1) {
//         fLoaders.warningSnackBar(
//             message: "Selected Product is out of stock", title: "Oh Snap!");
//       }
//     }
//     void removeFromCart(ProductModel product) {
//       // Quantity Check
//       if (productQuantityInCart.value < 1) {
//         return;
//       }
//
//       // Convert the ProductModel to a CartItemModel with the given quantity
//       final selectedCartItem =
//       convertToCartItem(product, productQuantityInCart.value);
//
//       // Check if already added in the Cart
//       int index = cartItems.indexWhere((cartItem) =>
//       cartItem.productId == selectedCartItem.productId &&
//           cartItem.variationId == selectedCartItem.variationId);
//
//       if (index >= 0) {
//         // Reduce the quantity or remove from cart if quantity is 0
//         if (cartItems[index].quantity > 1) {
//           cartItems[index].quantity -= 1;
//         } else {
//           cartItems.removeAt(index);
//         }
//       }
//
//       updateCart();
//       fLoaders.customToast(message: "Product quantity has been updated");
//     }
//
//     // Convert the ProductModel to a CartItemModel with the given quantity
//     final selectedCartItem =
//         convertToCartItem(product, productQuantityInCart.value);
//
//     // Check if already added in the Cart
//     int index = cartItems.indexWhere((cartItem) =>
//         cartItem.productId == selectedCartItem.productId &&
//         cartItem.variationId == selectedCartItem.variationId);
//
//     if (index >= 0) {
//       // This quantity is already added or Updated/Removed from the design (Cart)(-)
//       cartItems[index].quantity = selectedCartItem.quantity;
//     } else {
//       cartItems.add(selectedCartItem);
//     }
//
//     updateCart();
//     fLoaders.customToast(message: "Your Product has been added to the Cart");
//   }

  void addToCart(ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 1) {
      fLoaders.customToast(message: "Select Quantity");
      return;
    }

    // Variation Selected?
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      fLoaders.customToast(message: "Select Variation");
      return;
    }
    // Out of Stock Status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        fLoaders.warningSnackBar(
            message: "Selected variation is out of stock",
            title: "Oh Snap!");
        return;
      }
    } else {
      if (product.stock < 1) {
        fLoaders.warningSnackBar(
            message: "Selected Product is out of stock", title: "Oh Snap!");
      }
    }

    // Convert the ProductModel to a CartItemModel with the given quantity
    final selectedCartItem =
    convertToCartItem(product, productQuantityInCart.value);

    // Check if already added in the Cart
    int index = cartItems.indexWhere((cartItem) =>
    cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      // This quantity is already added or Updated/Removed from the design (Cart)(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    fLoaders.customToast(message: "Your Product has been added to the Cart");
  }

  void removeFromCart(ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 0) {
      return;
    }

    // Convert the ProductModel to a CartItemModel with the given quantity
    final selectedCartItem =
    convertToCartItem(product, productQuantityInCart.value);

    // Check if already added in the Cart
    int index = cartItems.indexWhere((cartItem) =>
    cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      // Reduce the quantity or remove from cart if quantity is 0
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems.removeAt(index);
      }
    }

    updateCart();
    fLoaders.customToast(message: "Product quantity has been updated");
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if(index >= 0) {
      if(cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // Show Dialog Before Completely Removing
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: "Remove Product",
      middleText: "Are you sure you want to remove this Product",
      onConfirm: ()  {
        // Remove the Item from Cart
        cartItems.removeAt(index);
        updateCart();
        fLoaders.customToast(message: "Product removed from the Cart");
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  /// Initialize already added item's Count in the Cart.
  void updateAlreadyAddedProductCount(ProductModel product) {

    if(product.productType == ProductType.single.toString()){
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {

      final variationId = variationController.selectedVariation.value.id;
      if(variationId.isNotEmpty) {
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);

      } else {
        productQuantityInCart.value = 0;
      }
    }
    }

  /// This function converts a ProductModel to a CartItemModel
  /// This function converts a ProductModel to a CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      // Reset Variation in case of single product type.
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
        ? variation.salePrice
        : variation.price
        : product.salePrice > 0.0
        ? product.salePrice
        : product.price;

    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      title: product.title,
      price: isVariation ? variation.salePrice : product.salePrice, // Corrected here
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : "",
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }
  /// Update Cart Values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    fLocalStorage.instance().writeData("cartItems", cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings = fLocalStorage.instance().readData<List<dynamic>>("cartItems");
    if(cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem =
        cartItems.where((item) => item.productId == productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere((item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
