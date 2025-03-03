import 'package:f/common/widgets/appbar/appbar.dart';
import 'package:f/common/widgets/custom_shapes/container/search_container.dart';
import 'package:f/common/widgets/layouts/grid_layouts.dart';
import 'package:f/common/widgets/products.cart/cart_menu_icon.dart';
import 'package:f/common/widgets/texts/success_heading.dart';
import 'package:f/features/personalization/screens/all_products/all_products.dart';
import 'package:f/features/personalization/screens/brand/brand_products.dart';
import 'package:f/features/shops/controllers/brand_controller.dart';
import 'package:f/features/shops/controllers/category_controller.dart';
import 'package:f/features/shops/screens/home/widgets/category_tab.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import '../../../common/texts/fBrandCard.dart';
import '../../../common/widgets/appbar/tappbar.dart';
import '../../personalization/screens/brand/all_brand.dart';
import '../../personalization/screens/brand/brands_shimmer.dart';

class fStoreScreen extends StatelessWidget {
  const fStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
          appBar: fAppBar(
            title: Text(
              "Store",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            actions: [
              fCartCountericon(
               // onPressed: () {},
                iconColor: fColors.black,
                //onPressed: () {  },
              )
            ],
          ),
          body: NestedScrollView(
              headerSliverBuilder: (_, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: fHelperFunctions.isDarkMode(context)
                        ? fColors.black
                        : fColors.white,
                    expandedHeight: 440,
                    flexibleSpace: (Padding(
                      padding: EdgeInsets.all(fSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          /// -- Search bar
                          SizedBox(
                            height: fSizes.spaceBtwItems,
                          ),
                          fSearch_Container(
                            text: "Search in Store",
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          SizedBox(
                            height: fSizes.spaceBtwSections,
                          ),

                          /// -- Featured Brands
                          fSectionHeading(
                            title: "Featured Brands",onPressed: ()=>Get.to(()=>AllBrandScreen())


                          ),
                          const SizedBox(
                            height: fSizes.spaceBtwItems / 1.5,
                          ),

                          Obx(
                            () {
                              if(brandController.isLoading.value) return fBrandShimmer();

                                  if(brandController.featuredBrands.isEmpty) {
                                    return Center(
                                      child: Text("No Data Found!", style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white),),
                                    );
                                  }

                              return  fGridlayout(
                                itemCount: brandController.featuredBrands.length,
                                mainAxisCount: 80,
                                itemBuilder: (_, index) {
                                  final brand = brandController.featuredBrands[index];
                                  return fBrandCard(
                                    showBorder: true, brand: brand,onTap: () => Get.to(() => BrandProduct(brand: brand,)),);

                                }); }
                          )
                        ],
                      ),
                    )),

                    /// Tabs -- Tutorial [Sections # 3, Video # 8]

                    bottom: fTabBar(
                      tabs:
                        categories.map((category) => Tab(child: Text(category.name))).toList()

                    )

                      ),

                ];
              },

              /// -- Body -- Tutorial [Section # 3, Video # 8]
              body: TabBarView(children:
            categories.map((category) => fCategoryTab(category: category)).toList()

      ))
      ));

  }
}
