import 'package:bitebybyte/constants/colors.dart';
import 'package:flutter/material.dart';

class TornPaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Create the path for the sharp torn paper
    final path = Path()
      ..moveTo(0, 0) // Top-left corner
      ..lineTo(0, size.height - 50); // Left edge down to near the bottom

    // Torn bottom edge with only sharp points
    path.lineTo(size.width * 0.1, size.height - 30); // Sharp point
    path.lineTo(size.width * 0.2, size.height - 60); // Sharp point
    path.lineTo(size.width * 0.3, size.height - 20); // Sharp point
    path.lineTo(size.width * 0.4, size.height - 50); // Sharp inward point
    path.lineTo(size.width * 0.5, size.height - 30); // Sharp point
    path.lineTo(size.width * 0.6, size.height - 70); // Sharp point
    path.lineTo(size.width * 0.7, size.height - 20); // Sharp point
    path.lineTo(size.width * 0.8, size.height - 60); // Sharp inward point
    path.lineTo(size.width * 0.9, size.height - 40); // Sharp point
    path.lineTo(size.width, size.height - 50); // Sharp point

    // Top edge of the paper
    path.lineTo(size.width, 0); // Top-right corner
    path.close(); // Close the shape

    // Draw the torn paper shape
    canvas.drawPath(path, paint);

    // Add a shadow effect for depth
    final shadowPaint = Paint()
      ..color = accentColor2
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(path.shift(Offset(0, 4)), shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}