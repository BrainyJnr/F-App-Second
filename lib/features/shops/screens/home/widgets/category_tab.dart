import 'package:f/common/widgets/layouts/grid_layouts.dart';
import 'package:f/common/widgets/product_cards/product_card_vertical.dart';
import 'package:f/common/widgets/texts/success_heading.dart';
import 'package:f/features/personalization/screens/all_products/all_products.dart';
import 'package:f/features/shops/controllers/category_controller.dart';
import 'package:f/features/shops/models/category_model.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:f/features/shops/models/vertical_product_shimmer.dart';
import 'package:f/features/shops/screens/store/category_brand.dart';
import 'package:f/utilis/helpers/cloud_helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/texts/brand_show_case.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';

class fCategoryTab extends StatelessWidget {
  const fCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return   ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
       Padding(
          padding: const EdgeInsets.all(fSizes.defaultSpace),
          child: Column(
            children:  [
              /// -- Brands
              CategoryBrand(category: category),
              const SizedBox(height: fSizes.spaceBtwItems,),




              /// -- Products
              FutureBuilder(future: controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {

                final response = fCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: fVerticalProductshimmer());
                if(response != null) return response;

                final products = snapshot.data!;

                  return  Column(
                  children:[
                    fSectionHeading(title: "You might like",onPressed: () => Get.to(AllProducts(title: category.name,
                    futureMethod: controller.getCategoryProducts(categoryId: category.id,limit: -1),
                    ))),
              const SizedBox(height: fSizes.spaceBtwItems,),
               fGridlayout(itemCount: products.length, itemBuilder: (_, index) =>  fProductCardVertical(product: products[index],)),



            ],
          );

      }),]
    ), )], );
  }
}
