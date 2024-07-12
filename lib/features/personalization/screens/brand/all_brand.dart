import 'package:f/common/texts/fBrandCard.dart';
import 'package:f/common/widgets/layouts/grid_layouts.dart';
import 'package:f/common/widgets/products/sortable/sortable_products.dart';
import 'package:f/common/widgets/texts/success_heading.dart';
import 'package:f/features/personalization/screens/brand/brand_products.dart';
import 'package:f/features/shops/controllers/brand_controller.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f/features/shops/controllers/brand_controller.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../authentication/screens/home/widgets/home.dart';
import '../../../shops/models/brand_model.dart';
import 'brands_shimmer.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: fAppBar(title: Text("Brand"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(fSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              fSectionHeading(title: "Brands",showActionButton: false,),
              SizedBox(
                height: fSizes.spaceBtwItems),

              /// Brands
              Obx(
                      () {
                    if(brandController.isLoading.value) return fBrandShimmer();

                    if(brandController.allBrands.isEmpty) {
                      return Center(
                        child: Text("No Data Found!", style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white),),);
                    }

                    return  fGridlayout(
                        itemCount: brandController.allBrands.length,
                        mainAxisCount: 80,
                        itemBuilder: (_, index) {
                          final brand = brandController.allBrands[index];
                          return fBrandCard(
                            showBorder: true, brand: brand,onTap: () => Get.to(() => BrandProduct(brand: brand)),);

                        }); }
              )

             ]
          ),
        ),
      ),
    );
  }
}
