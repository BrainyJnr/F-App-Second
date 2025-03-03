import 'dart:convert';
import 'package:f/data/repoositories/products/product_repository.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:f/utilis/local%20storage/storage_utilis.dart';
import 'package:f/utilis/popUps/loaders.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();


  /// Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize favorites by reading from storage
  void initFavorites()  {
    final json = fLocalStorage.instance().readData("favorites");
    if(json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }
  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if(!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      fLoaders.customToast(message: "Product has been added to the Wishlist.");
    } else {
      fLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      fLoaders.customToast(message: "Product has been removed from the Wishlist.");
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    fLocalStorage.instance().saveData("favorites", encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }

}