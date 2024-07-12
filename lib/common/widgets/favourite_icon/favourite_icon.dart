import 'package:f/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../icons/f_circular_icon.dart';
import 'favourite_controller.dart';

class fFavouriteIcon extends StatelessWidget {
  const fFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(() => fCircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ?  fColors.error : null,
      onpressed: () => controller.toggleFavoriteProduct(productId),

    ));
  }
}
