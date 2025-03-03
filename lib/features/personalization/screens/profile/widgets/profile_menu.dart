import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:f/utilis/constants/sizes.dart';

import '../../../controllers/user_controller.dart';

class fProfileMenu extends StatelessWidget {
  const fProfileMenu({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    required this.onPressed,
    required this.title,
    required this.value,

  });
  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return GestureDetector(
      onTap: onPressed,
      child: Padding(padding:  EdgeInsets.symmetric(vertical: fSizes.spaceBtwItems / 1.5),

      child: Row(
        children: [
          Expanded(flex: 3, child: Text(title,style: Theme.of(context).textTheme.labelLarge,overflow: TextOverflow.ellipsis,)),
          Expanded(flex: 5, child: Text(value,style: Theme.of(context).textTheme.labelMedium,overflow: TextOverflow.ellipsis,)),
          Expanded(child: Icon(icon,size: 18,))
        ],
      ),
      ));
  }
}
