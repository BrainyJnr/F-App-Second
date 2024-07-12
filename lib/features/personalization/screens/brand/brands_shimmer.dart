import 'package:f/common/widgets/layouts/grid_layouts.dart';
import 'package:f/features/authentication/screens/shimmer.dart';
import 'package:flutter/material.dart';

class fBrandShimmer extends StatelessWidget {
  const fBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return fGridlayout(
        mainAxisCount: 80,
        itemCount: itemCount,
        itemBuilder: (_, __) => const fShimmerEffect(width: 300, height: 80));
  }
}
