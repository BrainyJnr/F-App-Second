import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import '../../icons/f_circular_icon.dart';

class fQuantity_Product_With_Add_And_Remove extends StatelessWidget {
  const fQuantity_Product_With_Add_And_Remove({
    super.key, required this.quantity, this.add, this.remove,
  });
  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        fCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: fSizes.md,
          color: fHelperFunctions.isDarkMode(context)
              ? fColors.white
              : fColors.black,
          backgroungColor:
          fHelperFunctions.isDarkMode(context)
              ? fColors.darkGrey
              : fColors.light,
          onpressed: remove,
        ),
        const SizedBox(
          width: fSizes.spaceBtwItems,
        ),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          width: fSizes.spaceBtwItems,
        ),

        fCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: fSizes.md,
          color: fColors.white,
          backgroungColor: fColors.primary,
          onpressed: add,
        )
      ],
    );
  }
}
