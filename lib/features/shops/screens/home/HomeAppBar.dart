import 'package:f/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/text_strings.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products.cart/cart_menu_icon.dart';
import '../../../authentication/screens/shimmer.dart';

class fHomeAppBar extends StatelessWidget {
  const fHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return fAppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fTexts.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: fColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              // Display a shimmer loader while user profile is being loaded
              return const fShimmerEffect(width: 80, height: 15,);
            }else {
           return Text(
              controller.user.value.fullName,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .apply(color: fColors.white));
                  }
          }),
        ],
      ),
      actions: [
        fCartCountericon( iconColor: fColors.white,)
          //onPressed: () {  },)
      ],
    );
  }
}

