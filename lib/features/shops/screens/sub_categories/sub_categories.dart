import 'package:f/common/widgets/texts/success_heading.dart';
import 'package:f/features/personalization/screens/all_products/all_products.dart';
import 'package:f/features/shops/controllers/category_controller.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/helpers/cloud_helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f/common/widgets/appbar/appbar.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/images/f_rounded_image.dart';
import '../../../../common/widgets/product_cards/product_card_horinzontal.dart';
import '../../../../utilis/popUps/horizontal_product_shimmer.dart';
import '../../models/category_model.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: fAppBar(title: Text(category.name), showBackArrow: true),

      /// -- Body
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(fSizes.defaultSpace),
        child: Column(
          children: [
            /// Banner
            fRoundedImage(
              width: double.infinity,
              imageUrl: fImages.Banner2,
              applyImageRadius: true,
            ),
            const SizedBox(height: fSizes.spaceBtwSections),

            /// Sub Categories
            FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  /// Handlle loader, No Record, OR Message
                  const loader = fHorizontalProductShimmer();
                  final widget = fCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Record Found
                  final subCategories = snapshot.data!;

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {

                        final subCategory = subCategories[index];

                        return FutureBuilder(
                            future: controller.getCategoryProducts(categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              final widget =
                              fCloudHelperFunctions.checkMultiRecordState(
                                  snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              final products = snapshot.data!;

                            return Column(
                              children: [

                          fSectionHeading(
                              title: subCategory.name,
                              onPressed: () => Get.to(() => AllProducts(
                                   title: subCategory.name,
                                   futureMethod:
                                        controller.getCategoryProducts(
                                            categoryId: subCategory.id,
                                           limit: -1),
                                  ))),



                            const SizedBox(height: 120,),

                                     ListView.separated(
                                        itemCount: products.length,
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: fSizes.spaceBtwItems,
                                            ),
                                        itemBuilder: (context, index) =>
                                            fProductCardHorizontal(
                                              product: products[index],
                                            ))]);

                        });
                      });
                })
          ],
        ),
      )),
    );
  }
}
