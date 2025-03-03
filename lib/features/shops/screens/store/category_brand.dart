import 'package:f/common/texts/brand_show_case.dart';
import 'package:f/features/shops/controllers/brand_controller.dart';
import 'package:f/features/shops/models/category_model.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/image_strings.dart';

import '../../../../utilis/popUps/boxes_shimmer.dart';
import '../../../../utilis/popUps/list_tile_shimmer.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {


        /// Handle
      const loader = Column(
        children: [
          fListTileShimmer(),
          SizedBox(height: fSizes.spaceBtwItems,),
          fBoxesShimmer(),
          SizedBox(height: fSizes.spaceBtwItems,)
        ],
        );

        final widget = fCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
        if(widget != null) return widget;

        /// Record Found!
        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(future: controller.getBrandProducts(brandId: brand.id, limit: 3),
                builder: (context, snapshot) {

              final widget = fCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
              if(widget != null) return widget;

              /// Record Found!
                final products = snapshot.data!;


            return  fBrandshowCase(brand: brand, images: products.map((e) => e.thumbnail).toList());

            });

  }, ); }
    );
  }}
