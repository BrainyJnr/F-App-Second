import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utilis/constants/enums.dart';
import 'f_brand_title_text.dart';

class fBrandTitleWithVerificationIcon extends StatelessWidget {
  const fBrandTitleWithVerificationIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = fColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small

  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: fBrandTitleText(
          title: title,
          color: textColor,
          maxLines : maxLines,
          brandTextSize : brandTextSize,

        )),
        const SizedBox(width: fSizes.xs,),
        Icon(Iconsax.verify5,color: iconColor, size: fSizes.iconXs,),
      ],
    );
  }
}
