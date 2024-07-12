import 'package:flutter/material.dart';

class fButtomSheetTheme{
  fButtomSheetTheme._();

  static BottomSheetThemeData lightButtomSheetTheme = BottomSheetThemeData(
    showDragHandle : true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  static BottomSheetThemeData darkButtomSheetTheme = BottomSheetThemeData(

    showDragHandle : true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

}
