import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:f/utilis/constants/image_strings.dart';

import '../../../features/personalization/controllers/user_controller.dart';
import '../f_circular Images.dart';
import 'package:f/utilis/constants/colors.dart';

class fUserProfileTile extends StatelessWidget {
  const fUserProfileTile({
    super.key, required this.onPressed,

  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: fCircular_Images(
        image: fImages.CircleAvatar2,
        // backgroundColor: Colors.transparent,
        width: 60,
        height: 80,
        padding: 0,),
      title: Text(controller.user.value.fullName,style: Theme.of(context).textTheme.titleLarge!.apply(color: fColors.white),),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.labelLarge!.apply(color: fColors.white),),
      trailing: IconButton(onPressed: onPressed,icon:  Icon(Iconsax.edit,color:  fColors.white,),),
    );
  }
}
