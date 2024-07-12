import 'package:f/utilis/theme/custom_themes/Elevated_button_theme.dart';
import 'package:f/utilis/theme/custom_themes/Outline_button_theme.dart';
import 'package:f/utilis/theme/custom_themes/appBar_theme.dart';
import 'package:f/utilis/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:f/utilis/theme/custom_themes/check_box.dart';
import 'package:f/utilis/theme/custom_themes/chip_theme.dart';
import 'package:f/utilis/theme/custom_themes/text_field_theme.dart';
import 'package:f/utilis/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class fAppTheme {
  fAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: fTextTheme.lightTextTheme,
    chipTheme: fChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: fAppBarTheme.lightAppBarTheme,
    checkboxTheme: fCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: fButtomSheetTheme.lightButtomSheetTheme,
    elevatedButtonTheme: fElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: fOutlinedButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: fTextFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: fTextTheme.darkTextTheme,
    chipTheme: fChipTheme.darkChipTheme,
    appBarTheme: fAppBarTheme.darkAppBarTheme,
    checkboxTheme: fCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: fButtomSheetTheme.darkButtomSheetTheme,
    elevatedButtonTheme: fElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: fOutlinedButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: fTextFieldTheme.darkInputDecorationTheme,
  );
}