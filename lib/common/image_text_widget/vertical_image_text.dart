import 'package:f/common/widgets/f_circular%20Images.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/constants/image_strings.dart';
import 'package:f/utilis/helpers/helper_functions.dart';

class fVertivalImagesText extends StatelessWidget {
  const fVertivalImagesText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = fColors.white,
    this.backgroundColor,
    this.onTap,  this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 7),

        child: Column(
            children: [
              Container(
                width: 54,
                height: 54,
                padding: const EdgeInsets.all(fSizes.sm),
                decoration: BoxDecoration(
                    color: backgroundColor ?? (dark ? fColors.black : fColors.white),
                    borderRadius: BorderRadius.circular(100)
                ),
              /// Circular Icon
          // child:  Center(
         child:   fCircular_Images(image: image,
             fit: BoxFit.fitWidth,
                padding: fSizes.sm * 1.0,
                isNetworkImage: isNetworkImage,
               backgroundColor: backgroundColor,
                overlayColor: fHelperFunctions.isDarkMode(context) ? fColors.light : fColors.darkGrey,
             ),

                // child: Center(
                //   child: Image(image: AssetImage(fImages.shoeIcon2),fit: BoxFit.cover,),
                 ),

                        /// Text
              const SizedBox(height: fSizes.spaceBtwItems / 2,),
              SizedBox(
                  width: 50,
                  child:  Text(title,
                    style: Theme.of(context).textTheme.labelLarge!.apply(color: textColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )

              )
            ]
        ),
      ),
    );
  }
}
