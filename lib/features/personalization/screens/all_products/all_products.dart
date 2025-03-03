import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/common/widgets/layouts/grid_layouts.dart';
import 'package:f/common/widgets/product_cards/product_card_vertical.dart';
import 'package:f/features/shops/controllers/products/all_product_controller.dart';
import 'package:f/features/shops/models/vertical_product_shimmer.dart';
import 'package:f/utilis/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:f/utilis/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../shops/models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AllProductController());
    return Scaffold(
        appBar: fAppBar(title: Text(title), showBackArrow: true,),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(fSizes.defaultSpace),
              child: FutureBuilder(
                future: futureMethod ?? controller.fetchProductByQuery(query),
                 builder: (context, snapshot) {
                  const loader = fVerticalProductshimmer();
                  final widget = fCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                  // Return appropriate widget based  on snapshot state
                  if(widget != null) return widget;


                  // Products Found!
                  final products = snapshot.data!;

                    return  fSortableProducts(products: products);
                  }  ))
        ) ,

    );
  }
}

