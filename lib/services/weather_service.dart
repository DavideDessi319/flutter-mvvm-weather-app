import 'dart:convert';
import 'dart:io';

import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/services/weather_status.dart';
import 'package:weather_app_alpian/utils/constants.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  static Future<Object> getCurrentWeather() async {
    try {
      Uri apiUrl = Uri.parse(Constants.OPEN_WEATHER_CURRENT_URL);
      http.Response response = await http.get(apiUrl);
      if (response.statusCode != 200) {
        return ResponseError(
            statusCode: response.statusCode,
            message: 'Error performing the request');
      }
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      Weather currentWeather = Weather.fromJson(responseBody);
      return ResponseSuccess(
          statusCode: response.statusCode, data: currentWeather);
    } on HttpException {
      return ResponseError(
          statusCode: 400, message: 'No internet connection, try again later');
    } catch (error) {
      return ResponseError(statusCode: 500, message: 'Internal error');
    }
  }

  static Future<Object> getForecast() async {
    try {
      Uri apiUrl = Uri.parse(Constants.OPEN_WEATHER_FORECAST_URL);
      http.Response response = await http.get(apiUrl);

      if (response.statusCode != 200) {
        return ResponseError(
            statusCode: response.statusCode,
            message: 'Error performing the request');
      }
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      List<Weather> currentForecast =
          Weather.weatherListFromJson(responseBody['list']);
      return ResponseSuccess(
          statusCode: response.statusCode, data: currentForecast);
    } on HttpException {
      return ResponseError(
          statusCode: 400, message: 'No internet connection, try again later');
    } catch (error) {
      return ResponseError(statusCode: 500, message: 'Internal error');
    }
  }
}
