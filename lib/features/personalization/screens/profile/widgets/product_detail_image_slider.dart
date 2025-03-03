import 'package:cached_network_image/cached_network_image.dart';
import 'package:f/features/shops/controllers/products/image_controller.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import '../../../../../common/widgets/favourite_icon/favourite_icon.dart';
import '../../../../../common/widgets/icons/f_circular_icon.dart';
import '../../../../../common/widgets/images/f_rounded_image.dart';
import 'package:f/utilis/helpers/helper_functions.dart';

class fProductImageSlider extends StatelessWidget {
  const fProductImageSlider({
    super.key,
    required this.product, required this.productId,
  });

  final ProductModel product;
  final String productId;


  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    return fCurvedEdgeWidget(
        child: Container(
      color: dark ? fColors.darkerGrey : fColors.light,
      child: Stack(children: [
        /// Main Large Image
        SizedBox(
            height: 340,
            child: Padding(
              padding: EdgeInsets.all(fSizes.productImageRadius * 2),
              child: Center(child: Obx(() {
                final image = controller.selectedProductImage.value;
                return GestureDetector(
                  onTap: () => controller.showEnlargeImage(image),
                  child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: fColors.primary,
                          )),
                );
              })),
            )),

        /// Image Slider
        Positioned(
            right: 0,
            bottom: 30,
            left: fSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                        width: fSizes.spaceBtwItems,),
                  itemBuilder: (_, index) => Obx(() {
                        final imageSelected = controller.selectedProductImage.value == images[index];
                        return fRoundedImage(
                          width: 80,
                          isNetworkImage: true,
                          imageUrl: images[index],
                          padding: const EdgeInsets.all(fSizes.sm),
                          backgroundColor: dark ? fColors.dark : fColors.white,
                          onPressed: () => controller
                              .selectedProductImage.value = images[index],
                          border: Border.all(
                              color: imageSelected
                                  ? fColors.primary
                                  : Colors.transparent),
                        );
                      })),
            )),

        /// AppBar Icons
         fAppBar(
          showBackArrow: true,
          actions: [
            fFavouriteIcon(productId: product.id)]
            )
          ],
        )
      ),
    );
  }
}
