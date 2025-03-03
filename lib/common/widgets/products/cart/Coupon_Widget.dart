import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/sizes.dart';
import '../../../styles/fRoundedContainer.dart';
import 'package:f/utilis/helpers/helper_functions.dart';

class fCouponCode extends StatelessWidget {
  const fCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);

    return fRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? fColors.dark : fColors.white,
      padding: const EdgeInsets.only(top: fSizes.sm,bottom: fSizes.sm,right:fSizes.sm,left: fSizes.sm ),
      child: Row(
        children: [
          Flexible(child: TextFormField(
            decoration: InputDecoration(
              hintText: "Have a Promo Code? Enter here",
              hintStyle: TextStyle(fontSize: 13),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          )),

          /// Button,
          SizedBox(width: 76,child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: dark ? fColors.white.withOpacity(0.5) : fColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1))
            ),
            onPressed: (){},child: const Text("Apply"),),)
        ],
      ),
    );
  }
}
