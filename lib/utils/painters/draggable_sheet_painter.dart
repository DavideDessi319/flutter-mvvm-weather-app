import 'package:flutter/material.dart';

class DraggableSheetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height);
    path.cubicTo(
        -10, size.height * 0.8, 0, size.height * 0.5, 30, size.height * 0.4);
    path.cubicTo(size.width * 0.15, size.height * 0.3, size.width * 0.3,
        size.height * 0.52, size.width * 0.5, size.height * 0.5);
    path.cubicTo(size.width * 0.8, size.height * 0.5, size.width * 0.8,
        size.height * 0.3, size.width * 0.91, size.height * 0.35);
    path.quadraticBezierTo(size.width, 30, size.width + 10, size.height);
    path.lineTo(size.width, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
