import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:f/utilis/popUps/loaders.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';


import '../../../../data/repoositories/products/product_repository.dart';
import '../../../../utilis/constants/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();


      // Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> getAllProducts() async {
    try {

      // Fetch Products
      final products = await productRepository.getAllProducts();
      return products;
    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }




  /// Get the product Price or price range for variation
 String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // if no variation exists, return the simple price or sale price
   if(product.productType == ProductType.single.toString()){
     return (product.salePrice > 0? product.salePrice : product.price).toString();

     } else {
     for(var variation in product.productVariations!) {
       double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

       // Update smallest and largest prices
       if(priceToConsider < smallestPrice) {
         smallestPrice = priceToConsider;
       }

       if (priceToConsider > largestPrice) {
         largestPrice = priceToConsider;
       }

   }

     // if smallest and largest price are the same, return a single price
     if (smallestPrice.isEqual(largestPrice)) {
       return largestPrice.toString();
     } else {
       // Otherwise return a price range
       return "$smallestPrice - \$$largestPrice";
     }
   }


 }

   /// -- Calculate Discount Percentage
 String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
 }
  String getProductStockStatus(int stock) {
    return stock > 0 ? "In Stock": "Out of Stock";
  }

}