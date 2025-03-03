import 'package:f/common/styles/fRoundedContainer.dart';
import 'package:f/common/widgets/product_price_text.dart';
import 'package:f/common/widgets/texts/product_teitle_text.dart';
import 'package:f/common/widgets/texts/success_heading.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../common/widgets/chip/choice_chip.dart';
import '../../../../shops/controllers/products/variation_controller.dart';
import '../../../../shops/models/product_model.dart';

class fProductAttribute extends StatelessWidget {
  const fProductAttribute({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = fHelperFunctions.isDarkMode(context);

    // Reset the controller when the product changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.resetSelectedAttributes();
    });

    return Obx(() => Column(children: [
      if (controller.selectedVariation.value.id.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(left: 21),
          child: fRoundedContainer(
              padding: const EdgeInsets.all(fSizes.md),
              backgroundColor: dark ? fColors.darkerGrey : fColors.grey,
              child: Column(children: [
                /// Title, Price, and Stock Status
                Row(children: [
                  const fSectionHeading(title: "Variation", showActionButton: false),
                  SizedBox(width: fSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        const fProductTitleText(title: "Price : ", smallSize: true),

                        /// Actual Price
                        if (controller.selectedVariation.value.salePrice > 0)
                          Text(
                            "\$${controller.getVariationPrice()}",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        const SizedBox(width: fSizes.spaceBtwItems),

                        /// Sale Price
                        fProductPriceText(price: controller.getVariationPrice())
                      ]),

                      /// Stock
                      Row(children: [
                        const fProductTitleText(title: "Stock : ", smallSize: true),
                        Text(
                          controller.variationStockStatus.value,
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ])
                    ],
                  ),
                ]),

                /// Variation Description
                fProductTitleText(
                  title: controller.selectedVariation.value.description ?? "",
                  smallSize: true,
                  maxLines: 4,
                )
              ])),
        ),
      const SizedBox(height: 10),

      /// -- Attributes
      Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!
              .map((attribute) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fSectionHeading(title: attribute.name ?? "", showActionButton: false),
              SizedBox(height: fSizes.spaceBtwItems / 2),
              Obx(() => Wrap(
                spacing: 6,
                children: attribute.values!.map((attributeValue) {
                  final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                  final available = controller
                      .getAttributeAvailabilityInVariation(product.productVariations!, attribute.name!)
                      .contains(attributeValue);
                  return fChoiceChip(
                      text: attributeValue,
                      selected: isSelected,
                      onSelected: available
                          ? (selected) {
                        if (selected && available) {
                          controller.onAttributeSelected(
                              product, attribute.name ?? "", attributeValue);
                        }
                      }
                          : null);
                }).toList(),
              ))
            ],
          ))
              .toList(),
        ),
      )
    ]));
  }
}
