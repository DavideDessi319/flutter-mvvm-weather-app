import 'package:flutter/material.dart';

class DraggableSheetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.4);
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.15,
      size.width * 0.2,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.35,
      size.height * 0.5,
      size.width * 0.5,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.65,
      size.height * 0.5,
      size.width * 0.8,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.15,
      size.width,
      size.height * 0.4,
    );
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
