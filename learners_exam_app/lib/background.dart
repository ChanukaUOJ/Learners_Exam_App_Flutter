import 'package:flutter/material.dart';

class BackgroundCliper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    var roundedFactor = 0.0;

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundedFactor);
    //path.quadraticBezierTo(0, size.height, roundedFactor, size.height);
    path.lineTo(size.width - roundedFactor, size.height);
    //path.quadraticBezierTo(
    //size.width, size.height, size.width, size.height - roundedFactor);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
