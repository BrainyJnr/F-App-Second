import 'package:f/data/banner/banner_repository.dart';
import 'package:f/features/shops/models/banner_model.dart';
import 'package:f/utilis/popUps/loaders.dart';
import 'package:get/get.dart';


 class BannerController extends GetxController {

  /// Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final bannerRepository = Get.put(BannerRepository());

  RxList<BannerModel> allBanners = <BannerModel>[].obs;
   RxList<BannerModel> activebanners = <BannerModel>[].obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update Page Navigational Data
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);



    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}