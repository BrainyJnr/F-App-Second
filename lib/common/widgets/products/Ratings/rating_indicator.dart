import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:f/utilis/constants/colors.dart';

class fRatingBarIndicator extends StatelessWidget {
  const fRatingBarIndicator({
    super.key, required this.rating,

  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 18,
        unratedColor: fColors.grey,
        itemBuilder:(_,__)=> Icon(Iconsax.star1,color: fColors.primary,));
  }
}
