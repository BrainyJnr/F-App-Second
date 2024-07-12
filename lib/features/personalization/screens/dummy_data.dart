  import 'package:f/features/shops/models/banner_model.dart';
   import 'package:f/features/shops/models/brand_model.dart';
   import 'package:f/features/shops/models/product_model.dart';
 import 'package:f/features/shops/models/product_variation_model.dart';
 import 'package:f/routes/routes.dart';

 import '../../shops/models/category_model.dart';
 import 'package:f/utilis/constants/image_strings.dart';
 import '../../shops/models/product_attribute_model.dart';
import '../../shops/models/product_model.dart';
import '../../shops/models/product_model.dart';

 class fDummyData {



   static final List<CategoryModel> categories = [
    CategoryModel(id: "1", name: "Sports", image: fImages.sportIcon, isFeatured: true),
    CategoryModel(id: "5", name: "Furniture", image: fImages.furnitureIcon, isFeatured: true),
     CategoryModel(id: "2", name: "Electronics", image: fImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: "3", name: "Clothes", image: fImages.clothIcon, isFeatured: true),
     CategoryModel(id: "4", name: "Animals", image: fImages.animalIcon, isFeatured: true),
     CategoryModel(id: "6", name: "Shoes", image: fImages.shoeIcon, isFeatured: true),
     CategoryModel(id: "7", name: "Cosmetics", image: fImages.cosmeticsIcon, isFeatured: true),
     CategoryModel(id: "14", name: "Jewelry", image: fImages.jewelryIcon, isFeatured: true),

     ///SubCategories
     CategoryModel(id: "8", name: "Sport Shoes",parentId: "1", image: fImages.sportIcon, isFeatured: false),
     CategoryModel(id: "9", name: "Track Suits",parentId: "1", image: fImages.sportIcon, isFeatured: false),
     CategoryModel(id: "10", name: "Sport Equipments",parentId: "1", image: fImages.sportIcon, isFeatured: false),
     ///Furniture
     CategoryModel(id: "11", name: "Bedroom furniture",parentId: "5", image: fImages.furnitureIcon, isFeatured: false),
     CategoryModel(id: "12", name: "Kitchen furniture",parentId: "5", image: fImages.furnitureIcon, isFeatured: false),
     CategoryModel(id: "13", name: "Office furniture",parentId: "5", image: fImages.furnitureIcon, isFeatured: false),
     ///Electronics
     CategoryModel(id: "14", name: "laptop",parentId: "2", image: fImages.electronicsIcon, isFeatured: false),
     CategoryModel(id: "15", name: "Mobile",parentId: "2", image: fImages.electronicsIcon, isFeatured: false),//
     CategoryModel(id: "16", name: "Shirts",parentId: "3", image: fImages.clothIcon, isFeatured: false),


   ];
   static final List<BannerModel> Banners = [
     BannerModel(name: "ds", id: "1", imageUrl: fImages.Banner1, active: false, targetScreen: fRoutes.order, isFeatured: true),
     BannerModel(name: "nanaa", id: "2", imageUrl: fImages.Banner2, active: true, targetScreen: fRoutes.cart, isFeatured: false),
     BannerModel(name: "hhaa", id: "3", imageUrl: fImages.Banner3, active: true, targetScreen: fRoutes.favourites, isFeatured: false),
     BannerModel(name: "eio", id: "4", imageUrl: fImages.Banner4, active: true, targetScreen: fRoutes.settings, isFeatured: true),
     BannerModel(name: "hdh", id: "5", imageUrl: fImages.Banner5, active: true, targetScreen: fRoutes.userAddress, isFeatured: true),
     BannerModel(name: "kkxxx", id: "6", imageUrl: fImages.Banner6, active: true, targetScreen: fRoutes.checkout, isFeatured: true),
     BannerModel(name: "kkxxx", id: "8", imageUrl: fImages.Banner8, active: true, targetScreen: fRoutes.checkout, isFeatured: true),
   ];

   static final List<BrandModel> Brands = [
     BrandModel(id: "1", image: fImages.nikeLogo, name: "Nike", isFeatured: true,productsCount: 265),
     BrandModel(id: "2", image: fImages.Adidas, name: "Adidas", isFeatured: true,productsCount: 95),
     BrandModel(id: "3", image: fImages.Jordan, name: "Jordan", isFeatured: true,productsCount: 36),
     BrandModel(id: "6", image: fImages.Acer, name: "Acer", isFeatured: false,),
     BrandModel(id: "9", image: fImages.appleLogo, name: "Apple", isFeatured: true),
     BrandModel(id: "10", image: fImages.Puma, name: "Nike", isFeatured: true,productsCount: 65),
     BrandModel(id: "7", image: fImages.Ikea, name: "Ikea", isFeatured: false),
     BrandModel(id: "13", image: fImages.Kenwood, name: "Kenwood", isFeatured: false),
   ];



//   static final List<ProductModel> products = [
//      ProductModel(
//        id: "001",
//        title: "Green Nike sports shoe",
//        stock: 15,
//        price: 135,
//       isFeatured: true,
//        thumbnail: fImages.productImage1,
//        description: "Green Nike sports shoe",
//        brand: BrandModel(id: "1",
//            image: fImages.nikeLogo,
//            name: "Nike",
//            productsCount: 265,
//            isFeatured: true),
//        images: [
//          fImages.productImage1,
//          fImages.productImage23,
//          fImages.productImage21,
//          fImages.productImage9
//        ],
//        salePrice: 30,
//        sku: "ABR4568",
//        categoryId: "1",
//        productAttributes: [
//          ProductAttributeModel(name: "Color", values: ["Green", "Black", "Red"]),
//          ProductAttributeModel(name: "Size", values: ["EU30", "EU 32", "EU 34"]),
//        ],
//        productVariations: [
//          ProductVariationModel(
//          id: "1",
//              stock: 34,
//              price: 134,
//              salePrice: 122.6,
//             image: fImages.productImage1,
//              description: "This is a product description for Green Nike sports shoe.",
//              attributeValues: {"Color": "Green", "Size": "EU 34"}),
//          ProductVariationModel(
//            id: "2",
//            stock: 15,
//            price: 132,
//            image: fImages.productImage23,
//            attributeValues: {"Color": "Black", "Size": "EU 32"},
//          ),
//          ProductVariationModel(
//            id: "3",
//            stock: 0,
//            price: 234,
//            image: fImages.productImage23,
//            attributeValues: {"Color": "Black", "Size": "EU 34"},
//          ),
//          ProductVariationModel(
//              id: "4",
//              stock: 222,
//              price: 232,
//             image: fImages.productImage1,
//              attributeValues: {"Color": "Green", "Size": "EU 32"}
//          ),
//          ProductVariationModel(
//              id: "5",
//              stock: 0,
//              price: 334,
//              image: fImages.productImage21,
//              attributeValues: {"Color": "Red", "Size": "EU 34"}
//          ),
//         ProductVariationModel(
//              id: "6",
//              stock: 11,
//              price: 332,
//              image: fImages.productImage21,
//              attributeValues: {"Color": "Red", "Size": "EU 32"}
//         ),
//        ],
//        productType: "ProductType.variable",
//      ),
//      ProductModel(id: "002",
//          title: "Blue T-shirt for all ages",
//          stock: 15,
//          price: 35,
//          isFeatured: true,
     //    thumbnail: fImages.productImage69,
//          description: "This is a product description for Blue Sleeve less vest. There are more things that can be added but I am just protecting and nothing else.",
//          brand: BrandModel(id: "6", image: fImages.zaraLogo, name: "ZARA"),
//          images: [
//            fImages.productImage68,
//            fImages.productImage69,
//            fImages.productImage5
//          ],
//          salePrice: 30,
//          sku: "ABR4568",
//          categoryId: "16",
//          productAttributes: [
//            ProductAttributeModel(name: "Size", values: ["EU 34", "EU 32"]),
//           ProductAttributeModel(
//                name: "Color", values: ["Green", "Red", "Blue"]),
//          ],
//          productType: "ProductType.single"
//      ),
//      ProductModel(
//        id: "003",
//        title: "Leather brown Jacket",
//        stock: 15,
//        price: 30000,
//        isFeatured: false,
//        thumbnail: fImages.productImage64,
//        description:
//        "This is a product description for Leather brown Jacket. There are more things that can be added but I am just protecting and nothing else.",
//        brand: BrandModel(id: "6", image: fImages.zaraLogo, name: "ZARA",),
//        images: [fImages.productImage64, fImages.productImage65, fImages.productImage65,fImages.productImage67],
//        salePrice: 30,
//        sku: "ABR4568",
//        categoryId: "16",
//        productAttributes: [
//          ProductAttributeModel(name: "Size", values: ["EU34"]),
//          ProductAttributeModel(name: "Color", values: ["Green," "Red", "Blue"]),
//        ],
//        productType: "ProductType.single",
//      ),
//      ProductModel(
//        id: "004",
//        title: "4 Color collar t-shirt dry fit",
//        stock: 15,
//        price: 135,
//        isFeatured: false,
//        thumbnail: fImages.productImage60,
//        description: "This is a Product description for 4 color t-shirt dry fit. There are more things that can be added but its just a demo and nothing else.",
//        brand: BrandModel(id: "6", image: fImages.zaraLogo, name: "ZARA"),
//        images: [fImages.productImage60, fImages.productImage61, fImages.productImage62, fImages.productImage63],
//          salePrice: 30,
//        sku: "ABR4568",
//        categoryId: "16",
//        productAttributes: [
//          ProductAttributeModel(
//              name: "Color", values: ["Red", "Yellow", "Green", "Blue"]),
//         ProductAttributeModel(
//              name: "Size", values: ["EU 30", "EU 32", "EU 34"]),
//        ],
//        productVariations: [
//          ProductVariationModel(id: "1",
//              stock: 34,
//              salePrice: 122.6,
//              image: fImages.productImage60,
//              description: "This is a Product description for 4 Color collar t-shirt dry fit",
//              attributeValues: {"Color": "Red", "Size": "EU 34"}),
//          ProductVariationModel(id: "2",
//              stock: 15,
//              price: 132,
//              image: fImages.productImage60,
//              attributeValues: {"Color": "Red", "Size": "EU 32"}),
//          ProductVariationModel(id: "3",
//              stock: 0,
//              price: 234,
//              image: fImages.productImage61,
//              attributeValues: {"Color": "Yellow", "Size": "EU 34"}),
//          ProductVariationModel(id: "4",
//              stock: 222,
//              price: 232,
//              image: fImages.productImage61,
//              attributeValues: {"Color": "Yellow", "Size": "EU 32"}),
//          ProductVariationModel(id: "5",
//              stock: 0,
//              price: 334,
//              image: fImages.productImage62,
//              attributeValues: {"Color": "Green", "Size": "EU 34"}),
//          ProductVariationModel(id: "6",
//              stock: 11,
//              price: 332,
//              image: fImages.productImage62,
//              attributeValues: {"Color": "Green", "Size": "EU 30"}),
//          ProductVariationModel(id: "7",
//              stock: 0,
//              price: 334,
//              image: fImages.productImage63,
//              attributeValues: {"Color": "Blue", "Size": "EU 30"}),
//          ProductVariationModel(id: "8",
//              stock: 11,
//              price: 332,
//              image: fImages.productImage63,
//              attributeValues: {"Color": "Blue", "Size": "EU 34"}),
//        ],
//        productType: "ProductType.variable",
//      ),
//
//      ///Products after banner
//      ProductModel(
//        id: "005",
//        title: "Nike Air Jordan Shoes",
//       stock: 15,
//        price: 35,
//        isFeatured: false,
//        thumbnail: fImages.productImage10,
//        description: "Nike Air Jordan Shoes for running.Quality product, Long Lasting",
//       brand: BrandModel(id: "1",
//            image: fImages.nikeLogo,
//            name: "Nike",
//           productsCount: 265,
//           isFeatured: true),
//        images: [
//          fImages.productImage7,
//          fImages.productImage8,
//          fImages.productImage9,
//          fImages.productImage10,
//       ],
//        salePrice: 30,
//        sku: "ABR4568",
//        categoryId: "8",
//        productAttributes: [
//          ProductAttributeModel(
//              name: "Color", values: ["Orange", "Black", "Brown"]),
//          ProductAttributeModel(
//              name: "Size", values: ["EU 30", "EU 32", "EU 34"]),
//        ],
//        productVariations: [
//          ProductVariationModel(id: "1",
//              stock: 16,
//              price: 36,
//              salePrice: 12.6,
//              image: fImages.productImage8,
//              description: " We give you the best",
//              attributeValues: {"Color": "Orange", "Size": "EU 34"}),
//          ProductVariationModel(id: "2",
//              stock: 15,
//              price: 35,
//              image: fImages.productImage7,
//              attributeValues: {"Color": "Black", "Size": "EU 32"}),
//          ProductVariationModel(id: "3",
//              stock: 14,
//             price: 34,
//              image: fImages.productImage9,
//             attributeValues: {"Color": "Brown", "Size": "EU 34"}),
//          ProductVariationModel(id: "4",
//              stock: 13,
//              price: 33,
//             image: fImages.productImage7,
//              attributeValues: {"Color": "Black", "Size": "EU 34"}),
//          ProductVariationModel(id: "5",
//              stock: 12,
//              price: 32,
//              image: fImages.productImage9,
//              attributeValues: {"Color": "Brown", "Size": "EU 32"}),
//          ProductVariationModel(id: "6",
//              stock: 11,
//              price: 31,
//              image: fImages.productImage8,
//              attributeValues: {"Color": "Orange", "Size": "EU 32"}),
//       ],
//        productType: "ProductType.variables",
//      ),
//      ProductModel(
//        id: "006",
//        title: "SAMSUNG GALAXY S9(Pink,64 GB) (4 GB RAM)",
//        stock: 15,
//        price: 750,
//        isFeatured: false,
//        thumbnail: fImages.productImage11,
//        description:
//        "SAMSUNG Galaxy 59 (Pink, 64 GB) (4 GB RAM), Long Battery timing",
//        brand: BrandModel(id: "7", image: fImages.appleLogo, name: "Samsung"),
//        images: [fImages.productImage11, fImages.productImage12, fImages.productImage13, fImages.productImage12],
//        salePrice: 650,
//       sku: "ABR4568",
//        categoryId: "2",
//        productAttributes: [
//          ProductAttributeModel(name: "Size", values: ["EU34, EU32"]),
//          ProductAttributeModel(name: "Color", values: ["Green," "Red", "Blue"]),
//        ],
//        productType: "ProductType.single",
//      ),
//      ProductModel(
//        id: "007",
//        title: "TOMI Dog food",
//       stock: 15,
//       price: 20,
//       isFeatured: false,
//        thumbnail: fImages.productImage18,
//        description: "This is a product of TOMI Dog Food.",
//        brand: BrandModel(id: "7", image: fImages.appleLogo, name: "Tomi"),
//        salePrice: 10,
//        sku: "ARB4568",
//        categoryId: "4",
//        productAttributes: [
//          ProductAttributeModel(name: "Size", values: ["EU34", "EU32"]),
//          ProductAttributeModel(name: "Color", values: ["Green," "Red", "Blue"]),
//        ],
//        productType: "ProductType.single",
//      ),
//
//      /// 008 after 040
//      ProductModel(
//        id: "009",
//        title: "Nike Air Jordan 19 Blue",
//        stock: 15,
//        price: 400,
//        isFeatured: false,
//        thumbnail: fImages.productImage19,
//        description: "This is a Product description for Nike Air Jordan",
//        brand: BrandModel(id: "1", image: fImages.nikeLogo, name: "Nike"),
//        images: [
//          fImages.productImage19,
//         fImages.productImage20,
//         fImages.productImage21,
//          fImages.productImage22
//       ],
//        salePrice: 200,
//        sku: "ABR4568",
//        categoryId: "8",
//       productAttributes: [
//          ProductAttributeModel(name: "Size", values: ["EU 34", "EU 32"]),
//          ProductAttributeModel(name: "Color", values: ["Green", "Red", "Blue"]),
//        ],
//       productType: "ProductType.single",
//     ),
//     ProductModel(id: "010",
//          title: "Nike Air Jordan 6 Orange",
//          stock: 15,
//          price: 40,
//          isFeatured: true,
//          thumbnail: fImages.Orange1,
//          description: "This is a Product description of Orange Nike Air Jordan",
//           brand: BrandModel(id: "2",image: fImages.nikeLogo,name: "Nike"),
//       images: [
//           fImages.Orange1,
//           fImages.Orange4,
//            fImages.Orange3,
//          fImages.Orange2
//          ],
//          salePrice: 250,
//       sku: "ABR4568",
//
//       categoryId: "9",
//          productAttributes: [
//            ProductAttributeModel(name: "Size", values: ["EU 34", "EU 32"]),
//            ProductAttributeModel(name: "Color", values: ["Green", "Red", "Blue"]),
//          ],
//          productType: "ProductType.single",
//     ),
//
//    ];

//    static final List<ProductModel> products = [
// //      ProductModel(id: "013",
// //           title: "Puma Shoes",
// //           stock: 11,
// //           price: 110,
// //           isFeatured: false,
// //           thumbnail: fImages.Puma0,
// //           description: "Puma Shoes",
// //           brand: BrandModel(
// //             id: "10",
// //             image: fImages.Puma,
// //             name: "Puma",
// //             productsCount: 65,
// //             isFeatured: true,),
// //           images: [
// //             fImages.Puma1,
// //             fImages.Puma2,
// //             fImages.Puma3,
// //             fImages.Puma4
// //           ],
// //           salePrice: 40,
// //           sku: "ARB4568",
// //           categoryId: "1",
// //           productAttributes: [
// //             ProductAttributeModel(name: "Color",values: ["Green", "Black", "Red"]),
// //             ProductAttributeModel(name: "Size", values: ["EU30", "EU32", "EU34"]),
// //          ],
// //           productVariations: [
// //             ProductVariationModel(id: "1",
// //                 stock: 24,
// //                 price: 132,
// //                 image: fImages.Puma5,
// //                 description: "This is a product description for Puma.",
// //                 attributeValues: {"color": "Green", "Size": "EU34"}),
// //             ProductVariationModel(id: "2",
// //                 stock: 16,
// //                 price: 50,
// //                 image: fImages.Puma6,
// //                 attributeValues: {"Color": "Black", "Size": "EU32" }),
// //             ProductVariationModel(id: "3",
// //                 stock: 22,
// //                 price: 100,
// //                 image: fImages.Puma7,
// //                 attributeValues: {"Color": "Black", "Size": "EU34" }),
// //             ProductVariationModel(id: "4",
// //                 stock: 44,
// //                 price: 200,
// //                 image: fImages.Puma8,
// //                 attributeValues: {"Color": "Black", "Size": "EU34" }),
// //             ProductVariationModel(id: "5",
// //                 stock: 11,
// //                 price: 329,
// //                 image: fImages.Puma9,
// //                 attributeValues: {"Color": "Red", "Size": "EU34" }),
// //             ProductVariationModel(id: "6",
// //                 stock: 100,
// //                 price: 500,
// //                 image: fImages.Puma10,
// //                 attributeValues: {"Color": "Red", "Size": "EU32" }),
// //           ],
// //           productType: "ProductType.variable"
// //
// //    ),
    static final List<ProductModel> products = [
         ProductModel(
             id: "020",
             title: "Electronics",
             stock: 101,
             price: 320,
             isFeatured: false,
             thumbnail:fImages.Adi5,
             description: "This is a Product of description of Adidas.",
             brand: BrandModel(
             id:  "6", image: fImages.Adidas,name: "Adidas",),
             images: [
               fImages.Adi1,
               fImages.Adi2,
               fImages.Adi3,
               fImages.Adi4,
            ],
             salePrice: 230,
             sku: "ABR4568",
             categoryId: "8",
             productAttributes: [
               ProductAttributeModel(name: "Size", values: ["EU 34", "EU 32"]),
               ProductAttributeModel(name: "Color", values: ["Green", "Red", "Blue"]),
       ],
             productType: "ProductType.single",

       )  ];    // ProductModel(
//         id: "014",
//         title: "Furniture",
//         stock: 101,
//         price: 320,
//         isFeatured: false,
//         thumbnail:fImages.Adi5,
//         description: "This is a Product of description of Adidas.",
//         brand: BrandModel(
//           id:  "6", image: fImages.Adidas,name: "Adidas",),
//         images: [
//           fImages.Adi1,
//           fImages.Adi2,
//           fImages.Adi3,
//           fImages.Adi4,
//         ],
//         salePrice: 230,
//         sku: "ABR4568",
//         categoryId: "8",
//         productAttributes: [
//           ProductAttributeModel(name: "Size", values: ["EU 34", "EU 32"]),
//           ProductAttributeModel(name: "Color", values: ["Green", "Red", "Blue"]),
//         ],
//         productType: "ProductType.single",
//
//
//
//
//       ),        ProductModel(
//         id: "015",
//         title: "Cosmetics",
//         stock: 101,
//         price: 320,
//         isFeatured: false,
//         thumbnail:fImages.Adi5,
//         description: "This is a Product of description of Adidas.",
//         brand: BrandModel(
//           id:  "6", image: fImages.Adidas,name: "Adidas",),
//         images: [
//           fImages.Adi1,
//           fImages.Adi2,
//           fImages.Adi3,
//           fImages.Adi4,
//         ],
//         salePrice: 230,
//         sku: "ABR4568",
//         categoryId: "8",
//         productAttributes: [
//           ProductAttributeModel(name: "Size", values: ["EU 34", "EU 32"]),
//           ProductAttributeModel(name: "Color", values: ["Green", "Red", "Blue"]),
//         ],
//         productType: "ProductType.single",
//
//
//
//
//
//       ),ProductModel(
//           id: "16",
//           title: "Apartment",
//           stock: 101,
//           price: 320,
//           isFeatured: false,
//           thumbnail:fImages.Adi5,
//           description: "This is a Product of description of Adidas.",
//           brand: BrandModel(
//           id:  "6", image: fImages.Adidas,name: "Adidas",),
//       images: [
//         fImages.Adi1,
//         fImages.Adi2,
//         fImages.Adi3,
//         fImages.Adi4,
//       ],
//       salePrice: 230,
//       sku: "ABR4568",
//       categoryId: "8",
//       productAttributes: [
//         ProductAttributeModel(name: "Size", values: ["EU 34", "EU 32"]),
//         ProductAttributeModel(name: "Color", values: ["Green", "Red", "Blue"]),
//       ],
//       productType: "ProductType.single",),
//
//       ProductModel(
//           id: "017",
//           title: "Furniture",
//           stock: 101,
//           price: 320,
//           isFeatured: false,
//           thumbnail:fImages.Adi5,
//           description: "This is a Product of description of Adidas.",
//           brand: BrandModel(
//           id:  "6", image: fImages.Adidas,name: "Adidas",),
//       images: [
//         fImages.Adi1,
//         fImages.Adi2,
//         fImages.Adi3,
//         fImages.Adi4,
//       ],
//       salePrice: 230,
//       sku: "ABR4568",
//       categoryId: "8",
//       productAttributes: [
//         ProductAttributeModel(name: "Size", values: ["EU 34", "EU 32"]),
//         ProductAttributeModel(name: "Color", values: ["Green", "Red", "Blue"]),
//       ],
//       productType: "ProductType.single",),
//
//       ProductModel(
//           id: "018",
//           title: "Furniture",
//           stock: 101,
//           price: 320,
//           isFeatured: false,
//           thumbnail:fImages.Adi5,
//           description: "This is a Product of description of Adidas.",
//           brand: BrandModel(
//           id:  "6", image: fImages.Adidas,name: "Adidas",),
//       images: [
//         fImages.Adi1,
//         fImages.Adi2,
//         fImages.Adi3,
//         fImages.Adi4,
//       ],
//       salePrice: 230,
//       sku: "ABR4568",
//       categoryId: "8",
//       productAttributes: [
//         ProductAttributeModel(name: "Size", values: ["EU 34", "EU 32"]),
//         ProductAttributeModel(name: "Color", values: ["Green", "Red", "Blue"]),
//       ],
//       productType: "ProductType.single",),
//
//       ProductModel(
//           id: "019",
//           title: "Furniture",
//           stock: 101,
//           price: 320,
//           isFeatured: false,
//           thumbnail:fImages.Adi5,
//           description: "This is a Product of description of Adidas.",
//           brand: BrandModel(
//           id:  "6", image: fImages.Adidas,name: "Adidas",),
//       images: [
//         fImages.Adi1,
//         fImages.Adi2,
//         fImages.Adi3,
//         fImages.Adi4,
//       ],
//       salePrice: 230,
//       sku: "ABR4568",
//       categoryId: "8",
//       productAttributes: [
//         ProductAttributeModel(name: "Size", values: ["EU 34", "EU 32"]),
//         ProductAttributeModel(name: "Color", values: ["Green", "Red", "Blue"]),
//       ],
//       productType: "ProductType.single",)
//
//     ];







 }
//import 'package:f/utilis/constants/image_strings.dart';
  //
  // import '../../shops/models/category_model.dart';
  //
  // class fDummyData{
  //
  //   static final List<CategoryModel> allCategory = [
  //     CategoryModel(id: "1", name: "dan", image: fImages.productImage1, isFeatured: true),
  //     CategoryModel(id: "2", name: "menu", image: fImages.productImage1, isFeatured: true),
  //     CategoryModel(id: "3", name: "goog", image: fImages.productImage1, isFeatured: true),
  //     CategoryModel(id: "4", name: "din", image: fImages.productImage1, isFeatured: true),
  //     CategoryModel(id: "5", name: "fronk", image: fImages.productImage1, isFeatured: true),
  //     CategoryModel(id: "6", name: "sup", image: fImages.productImage1, isFeatured: true),
  //     CategoryModel(id: "7", name: "daniel", image: fImages.productImage1, isFeatured: true),
  //   ];
  //
  // }