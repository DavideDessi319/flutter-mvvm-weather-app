import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/services/weather_storage.dart';

import '../test_helpers/mock_data.dart';

void main() {
  late Weather mockCurrentWeather;
  late List<Weather> mockForecast;
  late WeatherStorage sut;
  late SharedPreferences sharedPreferences;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    mockCurrentWeather = Weather.fromJson(
      jsonDecode(MockData.currentWeatherJSON),
    );

    mockForecast = Weather.weatherListFromJson(
      jsonDecode(MockData.forecastJSON)['list'],
    );
    sut = WeatherStorage();
  });
  group('Current weather tests', () {
    test(
        'When a valid Weather object is saved, verify its value is retrievable',
        () async {
      Future future = sut.saveCurrentWeatherToStorage(
        weather: mockCurrentWeather,
        sharedPreferences: sharedPreferences,
      );

      await future;
      expect(
        await sut.getCurrentWeatherFromStorage(
          sharedPreferences: sharedPreferences,
        ),
        mockCurrentWeather,
      );
    });
  });

  group('Forecast weather tests', () {
    test('When a valid Forecast list is saved, verify its value is retrievable',
        () async {
      Future future = sut.saveForecastToStorage(
        forecast: mockForecast,
        sharedPreferences: sharedPreferences,
      );

      await future;
      expect(
        await sut.getForecastFromStorage(
          sharedPreferences: sharedPreferences,
        ),
        mockForecast,
      );
    });
  });
}
