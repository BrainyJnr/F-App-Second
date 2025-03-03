import 'package:f/common/texts/fBrandCard.dart';
import 'package:f/common/widgets/appbar/appbar.dart';
import 'package:f/common/widgets/products/sortable/sortable_products.dart';
import 'package:f/features/shops/controllers/brand_controller.dart';
import 'package:f/features/shops/models/brand_model.dart';
import 'package:f/features/shops/models/vertical_product_shimmer.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: fAppBar(title: Text(brand.name ),),
      body: SingleChildScrollView(

        child: Padding(padding: EdgeInsets.all(fSizes.defaultSpace),
        child: Column(
          children: [


            /// Brand Detail
            fBrandCard(showBorder: true, brand: brand),
            SizedBox(height: fSizes.spaceBtwSections,),


            FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {

                  const loader = fVerticalProductshimmer();
                  final widget = fCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null) return widget;

                  /// Record Found!
                  final brandProducts = snapshot.data!;
                  return fSortableProducts(products: brandProducts,);

                }
            )],
        ),


        ),
      ),
    );
  }
}
