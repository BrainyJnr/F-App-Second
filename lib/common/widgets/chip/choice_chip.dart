import 'package:f/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/helpers/helper_functions.dart';

import 'package:flutter/material.dart';

/// -- Most of the styling is already defined in the utils => Theme => ChipTheme.dart
class fChoiceChip extends StatelessWidget {
  const fChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,

  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = fHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() :  Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle:  TextStyle(color: selected ? fColors.white : null),
        avatar: isColor ? fCircular_Container(width: 50, height: 50, backgroundColor: fHelperFunctions.getColor(text)!): null,
        labelPadding: fHelperFunctions.getColor(text) != null ? const EdgeInsets.all(0) : null,
        // Make icon in the center
        padding: fHelperFunctions.getColor(text) != null ? const EdgeInsets.all(0) : null,
        shape: fHelperFunctions.getColor(text) != null ? const CircleBorder() : null,
        backgroundColor: fHelperFunctions.getColor(text) != null ? fHelperFunctions.getColor(text)! : null,

      ),
    );
  }
}

