import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/features/personalization/screens/all_products/all_products.dart';
import 'package:f/features/personalization/screens/settings/settings.dart';
import 'package:f/features/shops/controllers/products/product_controller.dart';
import 'package:f/features/shops/models/vertical_product_shimmer.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../../common/widgets/layouts/grid_layouts.dart';
import '../../../../../common/widgets/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/success_heading.dart';
import '../../../../personalization/controllers/search_2screen.dart';
import '../../../../shops/screens/home/HomeAppBar.dart';
import '../../../../shops/screens/home/home_categories.dart';
import '../../../../shops/screens/home/widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      /// Header -- Tutorial [Section # 3, Video # 2]
      fPrimaryHeaderContainer(
          child: Column(children: [
        /// -- AppBar -- Tutorial [Section # 3, Video " # 3]
        const fHomeAppBar(),
        const SizedBox(height: 15),

        /// --- Searchbar -- Tutorial [Section # 3, Video " # 4]
        fSearch_Container(
            text: 'Search in Store',
           // onTap: () => Get.to(() => ()
            ),
        SizedBox(
          height: 8,
        ),

        /// --Categories -- Tutorial [Section # 3, Video " # 4]
        Padding(
            padding: EdgeInsets.all(24),
            child: Column(children: [
              fSectionHeading(
                title: 'Popular Categories',
                showActionButton: false,
                textColor: fColors.white,
              ),
              SizedBox(
                height: fSizes.spaceBtwItems,
              ),

              /// Categories¨
              fHomeCategories(),
            ])),

        SizedBox(
          height: fSizes.spaceBtwSections,
        )
      ])),

      /// body --- Tutorial # 3, Video # 5]
      Padding(
          padding: EdgeInsets.all(18),
          child: Column(children: [
            fPromoSlider(),
            SizedBox(
              height: fSizes.spaceBtwItems,
            ),

            /// -- Heading
            fSectionHeading(
                title: "Popular Products",
                onPressed: () => Get.to(() => AllProducts(
                      title: 'Popular Products',
                      query: FirebaseFirestore.instance
                          .collection("Products")
                          .where("IsFeatured", isEqualTo: true)
                          .limit(6),
                      //      query: FirebaseFirestore.instance.collection("Products").limit(6),
                      futureMethod: controller.getAllProducts(),
                    ))),
            SizedBox(
              height: fSizes.spaceBtwItems,
            ),

            ///  -- Popular Products -- Tutorial [Section # 3, Video # 7]
            Obx(() {
              if (controller.isLoading.value)
                return const fVerticalProductshimmer();

              if (controller.featuredProducts.isEmpty) {
                return Center(
                    child: Text(
                  "No Data Found",
                  style: Theme.of(context).textTheme.bodySmall,
                ));
              }
              return fGridlayout(
                  itemCount: controller.featuredProducts.length,
                  itemBuilder: (_, index) => fProductCardVertical(
                        product: controller.featuredProducts[index],
                      ));
            }),
          ])),
    ])));
  }
}
