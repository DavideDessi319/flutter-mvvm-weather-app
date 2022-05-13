import 'package:flutter/material.dart';

class Constants {
  static final Shader headlineGradient = const LinearGradient(
    colors: <Color>[
      Colors.white12,
      Colors.white,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ).createShader(
    const Rect.fromLTRB(0, 250, 150, 150),
  );

  static const sunnyGradient = LinearGradient(
    colors: [
      Color(0xFF6BA3F5),
      Color(0xFF89BCF1),
      Color(0xFFA4D8F2),
      Color(0xFFB4E7F7),
      Colors.white
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
