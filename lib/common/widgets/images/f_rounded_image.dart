import 'package:cached_network_image/cached_network_image.dart';
import 'package:f/features/authentication/screens/shimmer.dart';
import 'package:f/features/shops/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:f/utilis/constants/colors.dart';


class fRoundedImage extends StatelessWidget {
  const fRoundedImage({
    super.key,

    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = fColors.light,
    this.fit = BoxFit.contain,
    this.padding,
     this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = fSizes.md,
    this.width = 1000,

  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width : width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            border: border, color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
            child: isNetworkImage
           ? CachedNetworkImage(
              fit: fit,
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  fShimmerEffect(width: width ?? double.infinity, height: height ?? 150,),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )
                : Image(fit: fit,image: AssetImage(imageUrl),)


    ),
        )
    );
  }
}
