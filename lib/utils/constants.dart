import 'package:flutter/material.dart';

class Constants {
  static const OPEN_WEATHER_API_KEY = '42c895268ae4184b9a894f9bf80fcff3';
  static const OPEN_WEATHER_CURRENT_URL =
      'https://api.openweathermap.org/data/2.5/weather?lat=51.507351&lon=-0.127758&appid=42c895268ae4184b9a894f9bf80fcff3&units=metric';
  static const OPEN_WEATHER_FORECAST_URL =
      'https://api.openweathermap.org/data/2.5/forecast?lat=51.507351&lon=-0.127758&appid=42c895268ae4184b9a894f9bf80fcff3&units=metric&cnt=5';
  static const OPEN_WEATHER_ICON_URL = 'http://openweathermap.org/img/wn/';
  static const OPEN_WEATHER_ICON_SUFFIX = '@4x.png';

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

  static const lightShadow = BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 4),
    blurRadius: 8,
    spreadRadius: 2,
  );
}
