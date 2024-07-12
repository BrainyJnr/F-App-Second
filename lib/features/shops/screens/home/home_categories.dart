import 'package:f/features/shops/screens/home/widgets/category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:get/get.dart';

import '../../../../common/image_text_widget/vertical_image_text.dart';
import '../../controllers/category_controller.dart';
import '../sub_categories/sub_categories.dart';

class fHomeCategories extends StatelessWidget {
  const fHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if(categoryController.isLoading.value) return fCategoryShimmer();

      if(categoryController.featuredCategories.isEmpty){
        return Center(child: Text("No Data Found!",style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white),),);
      }
      return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return fVertivalImagesText(
                  image: category.image,
                  title: category.name);
              //onTap: () => Get.to(() =>  SubCategoriesScreen(category: category)),);

            } )
      );
    } );
  }
}
