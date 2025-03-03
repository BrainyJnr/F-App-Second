import 'package:f/Navigation_menu.dart';
import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/common/widgets/loader/animated_loader.dart';
import 'package:f/data/repoositories/order_repositories.dart';
import 'package:f/features/shops/controllers/products/order_controller.dart';
import 'package:f/features/shops/models/product_model.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/cloud_helper_functions.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class fOrderListItems extends StatelessWidget {
  const fOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = fHelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          final emptyWidget = fAnimationLoaderWidget(
              text: "Whoops! No Orders Yet!",
              image: fImages.Animation1,
              showAction: true,
              actionText: "Let\s fill it",
              onActionPressed: () => Get.off(NavigationMenu()));

          final response = fCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// Congratulations Record Found.
          final orders = snapshot.data!;

          return ListView.separated(
              shrinkWrap: true,
              itemCount: orders.length,
              separatorBuilder: (_, __) => SizedBox(
                    height: fSizes.spaceBtwItems,
                  ),
              itemBuilder: (_, index) {
                final order = orders[index];
                return fRoundedContainer(
                    showBorder: true,
                    padding: EdgeInsets.all(fSizes.md),
                    backgroundColor: fHelperFunctions.isDarkMode(context)
                        ? fColors.dark
                        : fColors.light,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      /// -- Row 1
                      Row(
                        children: [
                          /// 1 - Icon
                          Icon(Iconsax.ship),
                          SizedBox(
                            width: fSizes.spaceBtwItems / 2,
                          ),

                          /// 2 - Status & Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.orderStatusText,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                          color: fColors.primary,
                                          fontWeightDelta: 1),
                                ),
                                Text(
                                  order.formattedOrderDate,
                                  style: Theme.of(context).textTheme.titleLarge,
                                )
                              ],
                            ),
                          ),

                          /// 3 - Icon
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Iconsax.arrow_right_34,
                                  size: fSizes.iconSm))
                        ],
                      ),
                      const SizedBox(
                        height: fSizes.spaceBtwItems,
                      ),

                      /// -- Bottom Row
                      Row(children: [
                        Expanded(
                          child: Row(
                            children: [
                              /// 1 - Icon
                              Icon(Iconsax.tag),
                              SizedBox(
                                width: fSizes.spaceBtwItems / 2,
                              ),

                              /// 2 - Status & Date
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Order",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!),
                                    Text(
                                      order.id,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    )
                                  ],
                                ),
                              ),

                              /// 3 - Icon
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              /// 1 - Icon
                              Icon(Iconsax.calendar),
                              SizedBox(
                                width: fSizes.spaceBtwItems / 2,
                              ),

                              /// 2 - Status & Date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Shipping Date",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!),
                                    Text(
                                      order.formattedDeliveryDate,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ]));
              });
        });
  }
}
