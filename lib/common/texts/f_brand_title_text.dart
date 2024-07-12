import 'package:flutter/material.dart';

import '../../utilis/constants/enums.dart';

class fBrandTitleText extends StatelessWidget {
  const fBrandTitleText({
    super.key,
    this.color,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    required this.brandTextSize,

  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: brandTextSize == TextSizes.large
      ? Theme.of(context).textTheme.labelSmall!.apply(color: color)
         : brandTextSize == TextSizes.large
      ? Theme.of(context).textTheme.bodyMedium!.apply(color: color)
        : brandTextSize == TextSizes.large
        ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
        : Theme.of(context).textTheme.bodyLarge!.apply(color: color)

    );
  }
}