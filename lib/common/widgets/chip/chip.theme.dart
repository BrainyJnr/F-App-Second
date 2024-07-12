import 'package:f/utilis/constants/colors.dart';
import 'package:flutter/material.dart';

class fChipTheme {
  fChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: fColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: fColors.black),
    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
    selectedColor: fColors.primary,
    checkmarkColor: fColors.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: fColors.darkerGrey,
    labelStyle: const TextStyle(color: fColors.white),
    selectedColor: fColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
    checkmarkColor: fColors.white,
  );
}