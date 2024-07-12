import 'package:f/features/personalization/screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iconsax/iconsax.dart';

import '../common/widgets/appbar/appbar.dart';
import '../features/personalization/controllers/search_controller.dart';
import '../features/personalization/screens/product_details/product_details.dart';
import '../features/shops/models/product_model.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    SearchPage searchController = Get.put(SearchPage());
    return Scaffold(
      appBar: AppBar(
         title:   TextField(
          onChanged: (value) {
            searchController.search(value);
          decoration: InputDecoration(
            hintText: 'Search...',hintStyle: TextStyle(color: Colors.black),
              suffixText: "Search",suffixStyle: TextStyle(color: Colors.black),
                fillColor: Colors.black,
                border: OutlineInputBorder(borderSide: BorderSide(width: 10000,color: Colors.white))

            );





          },
        ),),

    body:   Obx(() {
        if (searchController.searchResults.isNull) {
          return Center(child: Text('No results found.'));
        }

        return ListView.builder(
          itemCount: searchController.searchResults.length,
          itemBuilder: (context, index) {
            ProductModel result = searchController.searchResults[index];
            return InkWell(
              onTap: () {

               Get.to(ProductDetailScreen(product: result));
                   // transition: Transition.downToUp );
              },
            child:   ListTile(
              title: Text(result.title.toString()),
            )  );
          },
        );
      }),
    );
  }
}
