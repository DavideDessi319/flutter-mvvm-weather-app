import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_alpian/helpers/forecast_helper.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/services/weather_service.dart';
import 'package:weather_app_alpian/services/weather_status.dart';
import 'package:weather_app_alpian/utils/constants.dart';

import '../test_helpers/mock_classes.dart';
import '../test_helpers/mock_data.dart';
import 'package:http/http.dart' as http;

void main() {
  late MockHTTPClient httpClient;
  late WeatherServices sut;
  late Weather mockCurrentWeather;
  late List<Weather> mockForecast;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: '.env');
    httpClient = MockHTTPClient();
    sut = WeatherServices();
    mockCurrentWeather =
        Weather.fromJson(jsonDecode(MockData.currentWeatherJSON));
    mockForecast = Weather.weatherListFromJson(
      jsonDecode(MockData.forecastJSON)['list'],
    );
  });

  group(
    'getCurrentWeather tests',
    () {
      test(
        'When response is 200, return the json containing the current weather data',
        () async {
          when(
            () => httpClient.get(
              Uri.parse(Constants.openWeatherCurrentWeatherURL),
            ),
          ).thenAnswer(
            (invocation) async =>
                http.Response(MockData.currentWeatherJSON, 200),
          );

          Future future = sut.getCurrentWeather(httpClient: httpClient);
          dynamic responseStatus = await future;

          expect(responseStatus.runtimeType, Success);
          expect(responseStatus.data, mockCurrentWeather);
        },
      );

      test(
        'When response is not equals to 200, return Failure',
        () async {
          when(
            () => httpClient.get(
              Uri.parse(Constants.openWeatherCurrentWeatherURL),
            ),
          ).thenAnswer(
            (invocation) async =>
                http.Response('Error performing the request', 500),
          );

          Future future = sut.getCurrentWeather(httpClient: httpClient);
          dynamic responseStatus = await future;

          expect(responseStatus.runtimeType, Failure);
          expect(
              responseStatus,
              const Failure(
                  statusCode: 500, message: 'Error performing the request'));
        },
      );

      test(
        'When device has no connection, return Failure',
        () async {
          when(
            () => httpClient.get(
              Uri.parse(Constants.openWeatherCurrentWeatherURL),
            ),
          ).thenThrow(const SocketException('No Internet Connection'));

          Future future = sut.getCurrentWeather(httpClient: httpClient);
          dynamic responseStatus = await future;

          expect(responseStatus.runtimeType, Failure);
          expect(
              responseStatus,
              const Failure(
                  statusCode: 400,
                  message:
                      'Looks like you don\'t have internet connectivity, try again later. In the meantime, we\'re going to show you the latest available weather data'));
        },
      );

      test(
        'When request goes on timeout, return Failure',
        () async {
          when(
            () => httpClient.get(
              Uri.parse(Constants.openWeatherCurrentWeatherURL),
            ),
          ).thenThrow(TimeoutException('No Internet Connection'));

          Future future = sut.getCurrentWeather(httpClient: httpClient);
          dynamic responseStatus = await future;

          expect(responseStatus.runtimeType, Failure);
          expect(
              responseStatus,
              const Failure(
                  statusCode: 400,
                  message:
                      'The page took too long to load, try again and check your internet connection. In the meantime, we\'re going to show you the latest available weather data'));
        },
      );

      test(
        'When request goes on http exception, return Failure',
        () async {
          when(
            () => httpClient.get(
              Uri.parse(Constants.openWeatherCurrentWeatherURL),
            ),
          ).thenThrow(const HttpException('Invalid request'));

          Future future = sut.getCurrentWeather(httpClient: httpClient);
          dynamic responseStatus = await future;

          expect(responseStatus.runtimeType, Failure);
          expect(responseStatus,
              const Failure(statusCode: 400, message: 'Invalid request'));
        },
      );
    },
  );

  group(
    'getForecast tests',
    () {
      test(
        'When response is 200, return the json containing the forecast data',
        () async {
          when(
            () => httpClient.get(
              Uri.parse(Constants.openWeatherForecastURL),
            ),
          ).thenAnswer(
            (invocation) async => http.Response(MockData.forecastJSON, 200),
          );

          Future future = sut.getForecast(httpClient: httpClient);
          dynamic responseStatus = await future;

          expect(responseStatus.runtimeType, Success);
          expect(responseStatus.data,
              ForecastHepler.groupForecastByDate(mockForecast));
        },
      );

      test(
        'When response is not equals to 200, return Failure',
        () async {
          when(
            () => httpClient.get(
              Uri.parse(Constants.openWeatherForecastURL),
            ),
          ).thenAnswer(
            (invocation) async =>
                http.Response('Error performing the request', 500),
          );

          Future future = sut.getForecast(httpClient: httpClient);
          dynamic responseStatus = await future;

          expect(responseStatus.runtimeType, Failure);
          expect(
              responseStatus,
              const Failure(
                  statusCode: 500, message: 'Error performing the request'));
        },
      );

      test(
        'When device has no connection, return Failure',
        () async {
          when(
            () => httpClient.get(
              Uri.parse(Constants.openWeatherForecastURL),
            ),
          ).thenThrow(const SocketException('No Internet Connection'));

          Future future = sut.getForecast(httpClient: httpClient);
          dynamic responseStatus = await future;

          expect(responseStatus.runtimeType, Failure);
          expect(
              responseStatus,
              const Failure(
                  statusCode: 400,
                  message:
                      'Looks like you don\'t have internet connectivity, try again later. In the meantime, we\'re going to show you the latest available weather data'));
        },
      );

      test(
        'When request goes on timeout, return Failure',
        () async {
          when(
            () => httpClient.get(
              Uri.parse(Constants.openWeatherForecastURL),
            ),
          ).thenThrow(TimeoutException('No Internet Connection'));

          Future future = sut.getForecast(httpClient: httpClient);
          dynamic responseStatus = await future;

          expect(responseStatus.runtimeType, Failure);
          expect(
              responseStatus,
              const Failure(
                  statusCode: 400,
                  message:
                      'The page took too long to load, try again and check your internet connection. In the meantime, we\'re going to show you the latest available weather data'));
        },
      );

      test(
        'When request goes on http exception, return Failure',
        () async {
          when(
            () => httpClient.get(
              Uri.parse(Constants.openWeatherForecastURL),
            ),
          ).thenThrow(const HttpException('Invalid request'));

          Future future = sut.getForecast(httpClient: httpClient);
          dynamic responseStatus = await future;

          expect(responseStatus.runtimeType, Failure);
          expect(responseStatus,
              const Failure(statusCode: 400, message: 'Invalid request'));
        },
      );
    },
  );
}
