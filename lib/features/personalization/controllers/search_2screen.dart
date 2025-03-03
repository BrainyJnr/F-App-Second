import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/common/widgets/layouts/grid_layouts.dart';
import 'package:f/common/widgets/product_cards/product_card_vertical.dart';
import 'package:f/features/personalization/screens/product_details/product_details.dart';
import 'package:f/features/shops/controllers/products/all_product_controller.dart';
import 'package:f/features/shops/models/vertical_product_shimmer.dart';
import 'package:f/utilis/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:f/utilis/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:f/features/shops/controllers/products/all_product_controller.dart';

import '../../../common/widgets/custom_shapes/container/costom_textform_field.dart';
import '../../../common/widgets/products/sortable/sortable_products.dart';
import '../../shops/controllers/products/product_controller.dart';
import '../../shops/models/product_model.dart';

class search8 extends StatefulWidget {
  const search8({
    super.key,  this.product,

  });
  final ProductModel? product;




  @override
  State<search8> createState() => _search8State();
}

class _search8State extends State<search8> {
  final TextEditingController searchController = TextEditingController();
   late QuerySnapshot snapshotData;
  final controller = Get.put(AllProductController());
  late final ProductModel product;

  bool isExecuted = false;

  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(ProductDetailScreen(product: product),
                transition: Transition.downToUp,
                arguments: snapshotData.docs[index]

              );
            },
            child: ListTile(
              leading: CircleAvatar(
             //  backgroundImage: NetworkImage(snapshotData.docs[index].data()["thumbnail"]),

              ),
       //  title: Text(snapshotData.docs[index].data()["Image"],

        //  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              ),
       //  subtitle: Text(snapshotData.docs[index].data()["Title"],

         // style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
           //   )),
          );
            //trailing: Icon(I),);
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.delete),
        onPressed: () {
        setState(() {
          isExecuted = false;
        });
        },
      ),
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
              init: DataController(),
              builder: (val) {
                return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      val.queryData(searchController.text).then((value) {
                        snapshotData = value;
                        setState(() {
                          isExecuted = true;
                        });
                      });
                    });
              })
        ],
        title: TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
               hoverColor: Colors.black,
              hintText: "Search Products...",
              hintStyle: TextStyle(color: Colors.black)),
          controller: searchController,
        ),
        backgroundColor: Colors.blue,
      ),
      body: isExecuted
          ? searchedData()
          : Container(
              child: Center(
                child: Text(
                  "Search Products",
                  style: TextStyle(
                    color: Colors.black,fontSize: 30.0
                  ),
                ),
              ),
            ),
    );
  }
}
//import 'package:flutter/material.dart';
//
// class search extends StatefulWidget {
//   const search({Key? key,required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<search> createState() => _searchState();
// }
//
// class _searchState extends State<search> {
//   List<Map<String, dynamic>> _allUsers = [
//     {"id": 1, "Image": "Divine", "age": 29},
//     {"id": 2, "Image": "Delight", "age": 20},
//     {"id": 3, "Image": "Ayoba", "age": 26},
//     {"id": 4, "Image": "Chiamaka", "age": 49},
//     {"id": 5, "Image": "Godwin", "age": 54},
//     {"id": 6, "Image": "Chinyere", "age": 66},
//     {"id": 7, "Image": "Favour", "age": 5},
//     {"id": 8, "Image": "Amazing", "age": 2},
//     {"id": 9, "Image": "Ezóró", "age": 100},
//   ];
//
//   List<Map<String, dynamic>> _foundUsers = [];
//
//   @override
//   initState() {
//     _foundUsers = _allUsers;
//     super.initState();
//   }
//
//   void _runFilter(String enteredKeyword) {
//     List<Map<String, dynamic>> results = [];
//     if (enteredKeyword.isEmpty) {
//       results = _allUsers;
//    } else {
//       results = _allUsers
//           .where((user) =>
//           user["Image"].toLowerCase().contains(enteredKeyword.toLowerCase()))
//               .toList();
//
//           }
//                  setState((){
//                 _foundUsers = results;
//       });
//     }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Column(children: [
//               SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 onChanged: (value) => _runFilter(value),
//                 decoration: InputDecoration(
//                     labelText: "Search.....", suffixIcon: Icon(Icons.search)),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: _foundUsers.length,
//                   itemBuilder: (context, index) =>
//                       Card(
//                           key: ValueKey(_foundUsers[index]["id"]),
//                           color: Colors.blue,
//                           elevation: 4,
//                           margin: EdgeInsets.symmetric(vertical: 10),
//                           child: ListTile(
//                             leading: Text(
//                               _foundUsers[index]["id"].toString(),
//                               style: TextStyle(
//                                   fontSize: 24, color: Colors.white),
//                             ),
//                             title: Text(
//                               _foundUsers[index]["Image"],
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             subtitle: Text(
//                               "${_foundUsers[index]["age"].toString()} years old",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           )),
//                 ),
//               ),
//             ])));
//   }
// }
