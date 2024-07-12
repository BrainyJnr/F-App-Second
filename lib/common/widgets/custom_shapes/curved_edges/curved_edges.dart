import 'package:flutter/material.dart';

class fCustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
  var path = Path();
  path.lineTo(0, size.height);

  final firstCurve = Offset(0,size.height - 20);
  final lastCurve = Offset(30,size.height - 20);
  path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

  final SecondFirstCurve = Offset(0,size.height - 20);
  final SecondlastCurve = Offset(size.width - 30, size.height - 20);
  path.quadraticBezierTo(SecondFirstCurve.dx, SecondFirstCurve.dy, SecondlastCurve.dx, SecondlastCurve.dy);

  final thirdFirstCurve = Offset(size.width, size.height -20 );
  final thirdlastCurve = Offset(size.width, size.height );
  path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, thirdlastCurve.dx, thirdlastCurve.dy);


  path.lineTo(size.width, 0);
  path.close();
  return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}