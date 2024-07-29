import 'package:f/navigation_menu.dart';
import 'package:f/common/widgets/appbar/appbar.dart';
import 'package:f/common/widgets/favourite_icon/favourite_controller.dart';
import 'package:f/common/widgets/icons/f_circular_icon.dart';
import 'package:f/common/widgets/layouts/grid_layouts.dart';
import 'package:f/common/widgets/loader/animated_loader.dart';
import 'package:f/common/widgets/product_cards/product_card_vertical.dart';
import 'package:f/features/authentication/screens/home/widgets/home.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:f/features/shops/models/vertical_product_shimmer.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';import 'package:f/utilis/constants/image_strings.dart';

import '../../../../common/widgets/products/cart/widgets/loader_widget.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: fAppBar(
        title: Text("Wishlist",style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          fCircularIcon(icon: Iconsax.add,onpressed: ()=>Get.to(const HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(fSizes.defaultSpace),
            child: Obx(()
              => FutureBuilder(
                future: controller.favoriteProducts(),
                builder: (context, snapshot) {

                  final emptyWidget = fAnimationLoaderWidget(text: "Whoops Wishlist is Empty....", image: fImages.cart2,
                  showAction: true,
                    actionText: "Let\'s get started by adding",
                    onActionPressed: () => Get.off(() => NavigationMenu()),
                  );

                  const loader = fVerticalProductshimmer(itemCount: 6,);
                  final widget = fCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                  if (widget != null) return widget;


                  final products = snapshot.data!;
                  return  fGridlayout(
                      itemCount: products.length,
                      itemBuilder: (_,index) => fProductCardVertical(product: products[index])
                  );
                } ),
            ),
            ),
            ),

    );
  }
}
