import 'package:flutter/material.dart';

// 1. CustomPainter to draw the ribbon shape
class RibbonPainter extends CustomPainter {
  final Color color;

  RibbonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final double width = size.width;
    final double height = size.height;
    final double cutDepth = 12.0; // Depth of the V-cut or fold

    final Path path = Path();

    // Start at top-left
    path.lineTo(width, 0); // Line to top-right
    path.lineTo(width, height); // Line to bottom-right

    // Create the 'V' cut (fold effect) at the bottom-left corner
    path.lineTo(0, height); // Line to point before the cut
    path.lineTo(cutDepth, height - (height / 2)); // Line to the 'V' point
    path.lineTo(0, 0); // Line back to the top-left edge near the cut

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
