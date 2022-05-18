import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_alpian/models/weather.dart';

class WeatherStorage {
  Future saveCurrentWeatherToStorage({
    required Weather weather,
    required SharedPreferences sharedPreferences,
  }) async {
    try {
      String encodedCurrentWeather = jsonEncode(weather);
      sharedPreferences.setString(
        'latest_current_weather',
        encodedCurrentWeather,
      );
    } catch (error) {
      return;
    }
  }

  Future<Weather?> getCurrentWeatherFromStorage({
    required SharedPreferences sharedPreferences,
  }) async {
    try {
      String? encodedCurrentWeather =
          sharedPreferences.getString('latest_current_weather');
      if (encodedCurrentWeather == null) {
        return null;
      }
      Map<String, dynamic> currentWeatherMap =
          jsonDecode(encodedCurrentWeather);
      Weather currentWeather = Weather.fromJson(currentWeatherMap);

      return currentWeather;
    } catch (error) {
      return null;
    }
  }

  Future saveForecastToStorage({
    required List<Weather> forecast,
    required SharedPreferences sharedPreferences,
  }) async {
    try {
      String encodedForecast = jsonEncode(forecast);
      sharedPreferences.setString(
        'latest_forecast',
        encodedForecast,
      );
    } catch (error) {
      return;
    }
  }

  Future<List<Weather>> getForecastFromStorage({
    required SharedPreferences sharedPreferences,
  }) async {
    try {
      String? encodedForecast = sharedPreferences.getString('latest_forecast');
      if (encodedForecast == null) {
        return [];
      }
      List<dynamic> forecastMap = jsonDecode(encodedForecast);
      List<Weather> forecast = Weather.weatherListFromJson(forecastMap);

      return forecast;
    } catch (error) {
      return [];
    }
  }
}
