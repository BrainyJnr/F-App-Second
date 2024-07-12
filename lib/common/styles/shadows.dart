import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';


class fShadowStyle {

  static final verticalProductShadow = BoxShadow(
    color: fColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
      color: fColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}