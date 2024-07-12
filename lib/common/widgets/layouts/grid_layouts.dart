import 'package:flutter/material.dart';

import 'package:f/utilis/constants/sizes.dart';


class fGridlayout extends StatelessWidget {
  const fGridlayout({
    super.key,
    required this.itemCount,
    this.mainAxisCount = 294,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding:  EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent : mainAxisCount,
          mainAxisSpacing: fSizes.gridViewSpacing,
          crossAxisSpacing: fSizes.gridViewSpacing,
        ),
        itemBuilder: itemBuilder,
    );
  }
}