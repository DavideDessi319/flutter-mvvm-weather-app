import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_alpian/models/weather.dart';

class WeatherStorage {
  Future saveCurrentWeatherToStorage(Weather weather) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String encodedCurrentWeather = jsonEncode(weather);
      sharedPreferences.setString(
        'latest_current_weather',
        encodedCurrentWeather,
      );
    } catch (error) {
      return;
    }
  }

  Future<Weather?> getCurrentWeatherFromStorage() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
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

  Future saveForecastToStorage(List<Weather> forecast) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String encodedForecast = jsonEncode(forecast);
      sharedPreferences.setString(
        'latest_forecast',
        encodedForecast,
      );
    } catch (error) {
      return;
    }
  }

  Future<List<Weather>> getForecastFromStorage() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
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
