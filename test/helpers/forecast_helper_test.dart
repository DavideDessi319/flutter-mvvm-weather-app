import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_alpian/helpers/forecast_helper.dart';
import 'package:weather_app_alpian/models/weather.dart';

import '../test_helpers/mock_data.dart';

void main() {
  late List<Weather> mockForecast;
  setUp(() {
    mockForecast = Weather.weatherListFromJson(
      jsonDecode(MockData.forecastJSON)['list'],
    );
  });

  test(
    '''When groupForecastByDate is called, return a List<Weather> with the first element of a date, minus the first date. 
       The list should always contain 5 elements''',
    () async {
      List<Weather> groupedForecast =
          ForecastHepler.groupForecastByDate(mockForecast);
      expect(groupedForecast.length, 5);
    },
  );

  test(
    '''When exception is thrown, return an empty list''',
    () async {
      List<Weather> groupedForecast = ForecastHepler.groupForecastByDate([]);
      expect(groupedForecast, []);
    },
  );

  /* test(
    'When an element has an invalid date, catch the exception and return an empty list',
    () async {
      mockForecast.elementAt(0).dt = 33;
      expect(ForecastHepler.groupForecastByDate(mockForecast), []);
    },
  ); */
}
