import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'curved_edges.dart';


class fCurvedEdgeWidget extends StatelessWidget {
  const fCurvedEdgeWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: fCustomCurvedEdges(),
      child: child,
    );
  }
}
