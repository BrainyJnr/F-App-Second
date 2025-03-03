import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:f/utilis/constants/sizes.dart';

import '../../features/authentication/screens/shimmer.dart';

class fCircular_Images extends StatelessWidget {
  const fCircular_Images({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    AssetImage = false,
    this.height = 56,
    this.padding = fSizes.sm


  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        //color: backgroundColor ?? (fHelperFunctions.isDarkMode(context) ? fColors.black : fColors.white),
            borderRadius: BorderRadius.circular(1)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
    //  child: Center(
      child: isNetworkImage
          ? CachedNetworkImage(
        fit: fit,
        color : overlayColor,
        imageUrl : image,
        progressIndicatorBuilder: (context, url, downloadProgress) => const fShimmerEffect(width: 55, height : 55,radius : 55 ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      )
       : Image (
        fit: fit,
        image:  AssetImage(image),
        color: overlayColor,

      ),)
    );
  }
}
