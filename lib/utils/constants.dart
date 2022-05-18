import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static final String? openWeatherAPIKey = dotenv.env['OPENWEATHERMAP_API_KEY'];
  static final String openWeatherCurrentWeatherURL =
      dotenv.env['OPENWEATHERMAP_CURRENT_WEATHER_URL']! + openWeatherAPIKey!;
  static final String openWeatherForecastURL =
      dotenv.env['OPENWEATHERMAP_FORECAST_URL']! + openWeatherAPIKey!;

  // coverage:ignore-start
  static final String? openWeatherIconURL =
      dotenv.env['OPENWEATHERMAP_ICON_URL'];
  static const String openWeatherIconSuffix = '@4x.png';

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
  // coverage:ignore-end

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

  static const cloudyGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 135, 203, 222),
      Color.fromARGB(255, 166, 194, 226),
      Color(0xFFd3e4f8),
      Color(0xFFf6fafd),
      Colors.white
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const rainyGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 152, 176, 208),
      Color.fromARGB(255, 122, 149, 187),
      Color(0xFFb0cdef),
      Color(0xFFd3e4f8),
      Color(0xFFf6fafd),
      Colors.white
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const nightGradient = LinearGradient(
    colors: [
      Color(0xFF2B2F77),
      Color.fromARGB(255, 59, 64, 164),
      Color.fromARGB(255, 87, 59, 164),
      Color(0xFF6B4984),
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
