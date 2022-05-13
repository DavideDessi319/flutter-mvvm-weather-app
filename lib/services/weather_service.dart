import 'dart:convert';

import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/utils/constants.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  static Future<Weather?> getCurrentWeather() async {
    try {
      Uri apiUrl = Uri.parse(Constants.OPEN_WEATHER_URL);
      http.Response response = await http.get(apiUrl);

      if (response.statusCode != 200) {
        throw Error.safeToString('Error getting the weather data from the API');
      }
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      Weather currentWeather = Weather.fromJson(responseBody);
      return currentWeather;
    } catch (error) {
      return null;
    }
  }
}
