import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/services/weather_storage.dart';

import '../test_helpers/mock_classes.dart';
import '../test_helpers/mock_data.dart';

void main() {
  late Weather mockCurrentWeather;
  late List<Weather> mockForecast;
  late WeatherStorage sut;
  late SharedPreferences sharedPreferences;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    mockSharedPreferences = MockSharedPreferences();
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

    test('When an exception is thrown, return null when retrieving the data',
        () async {
      when(
        () => mockSharedPreferences.setString(
          'latest_current_weather',
          '',
        ),
      ).thenThrow(
        Error(),
      );

      Future future = sut.saveCurrentWeatherToStorage(
        weather: mockCurrentWeather,
        sharedPreferences: mockSharedPreferences,
      );

      await future;
      expect(
        await sut.getCurrentWeatherFromStorage(
          sharedPreferences: mockSharedPreferences,
        ),
        null,
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

    test(
        'When an exception is thrown, return an empty list when retrieving the data',
        () async {
      when(
        () => mockSharedPreferences.setString(
          'latest_forecast',
          '',
        ),
      ).thenThrow(
        Error(),
      );

      Future future = sut.saveForecastToStorage(
        forecast: mockForecast,
        sharedPreferences: mockSharedPreferences,
      );

      await future;
      expect(
        await sut.getForecastFromStorage(
          sharedPreferences: mockSharedPreferences,
        ),
        [],
      );
    });

    test(
        'When an an exception is thrown retrieving the data, return an empty list ',
        () async {
      when(
        () => mockSharedPreferences.getString(
          'latest_forecast',
        ),
      ).thenThrow(
        Error(),
      );

      expect(
        await sut.getForecastFromStorage(
          sharedPreferences: mockSharedPreferences,
        ),
        [],
      );
    });
  });
}
