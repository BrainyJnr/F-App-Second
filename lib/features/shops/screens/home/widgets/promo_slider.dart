import 'package:carousel_slider/carousel_slider.dart';
import 'package:f/features/authentication/screens/shimmer.dart';
import 'package:f/features/shops/controllers/banner_controller.dart';
import 'package:f/features/shops/controllers/home_controller.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../common/widgets/images/f_rounded_image.dart';

class fPromoSlider extends StatelessWidget {
  const fPromoSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
        () {
          // Loaders
          if(controller.isLoading.value) return fShimmerEffect(width: double.infinity, height: 190);

          // No data found
          if (controller.banners.isEmpty) {
            return const Center(child: Text("No Data Found!"),);
          } else {
          return Column(
          children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index)
          ),
          items:
            controller.banners.map((banner) => fRoundedImage(
              imageUrl: banner.imageUrl,
              //image: banner.image,
              //isNetworkImage: true, onPressed: () => Get.toNamed(banner.targetScreen),)).toList()
             isNetworkImage: true, onPressed: () => Get.toNamed(banner.targetScreen))).toList(),
        ),
        const SizedBox(
          height: fSizes.spaceBtwItems,
        ),
        Center(
      child: Obx(
            () =>  Row(
            mainAxisSize: MainAxisSize.min,
              children: [
            for (int i = 0; i < controller.banners.length; i++)
              fCircular_Container(
                width: 20,
                height: 4,
                margin: EdgeInsets.only(right: 10),
                backgroundColor: controller.carousalCurrentIndex.value == i ? fColors.primary : fColors.grey,
              )
          ]),
        )
        ),
          ]
        );
        }}
    );
  }
}