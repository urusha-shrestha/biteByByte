import 'package:bitebybyte/constants/colors.dart';
import 'package:flutter/material.dart';

class AbstractShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = accentColor // Set your desired color here
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width * 0.75, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.0, size.width * 0.25, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.1, size.height * 0.5, size.width * 0.17, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.35, size.height  , size.width * 0.77, size.height * 0.65);
    path.quadraticBezierTo(
        size.width*0.9 , size.height * 0.5, size.width * 0.75, size.height * 0.3);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
