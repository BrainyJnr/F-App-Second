import 'package:f/features/shops/controllers/products/all_product_controller.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:f/utilis/constants/sizes.dart';

import '../../layouts/grid_layouts.dart';
import '../../product_cards/product_card_vertical.dart';

class fSortableProducts extends StatelessWidget {
  const fSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
        children: [

        //  Padding(padding: EdgeInsets.only(right: 200,bottom: 5) ,
       // child : Text("Products")),

          /// DropDown
          DropdownButtonFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            value: controller.selectedSortOption.value,
            onChanged: (value) {
              // Sort products based on the selected option
              controller.sortProducts(value!);
            },
            items: ["Name", "Higher Price", "Lower Price", "Newest", "Popularity"]
                .map((option) =>
                DropdownMenuItem(value: option, child: Text(option)))
                .toList(),

          ),
          const SizedBox(height: fSizes.spaceBtwSections,),
          /// Products
          Obx(() =>  fGridlayout(itemCount: controller.products.length, itemBuilder: (_, index) => fProductCardVertical(product: controller.products[index],)))
        ],
    );
  }
}
