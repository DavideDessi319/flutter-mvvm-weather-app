import 'package:flutter/material.dart';

class Background {
  final LinearGradient backgroundGradient;
  final String backgroundImagePath;
  final String midgroundImagePath;
  final String foregroundImagePath;

  const Background({
    required this.backgroundGradient,
    required this.backgroundImagePath,
    required this.midgroundImagePath,
    required this.foregroundImagePath,
  });
}
