import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/services/weather_status.dart';
import 'package:weather_app_alpian/view_models/forecast_view_model.dart';
import 'package:http/http.dart' as http;
import '../test_helpers/mock_classes.dart';
import '../test_helpers/mock_data.dart';

void main() {
  late MockWeatherServices mockWeatherServices;
  late MockWeatherStorage mockWeatherStorage;
  late ForecastViewModel sut;
  late List<Weather> mockForecast;
  // ignore: unused_local_variable
  late http.Client httpClient;
  late SharedPreferences sharedPreferences;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(httpClient = http.Client());
    mockForecast = Weather.weatherListFromJson(
      jsonDecode(MockData.forecastJSON)['list'],
    );
    mockWeatherServices = MockWeatherServices();
    mockWeatherStorage = MockWeatherStorage();
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    sut = ForecastViewModel(
      init: false,
      weatherServices: mockWeatherServices,
      weatherStorage: mockWeatherStorage,
    );
  });

  group(
    'ForecastViewModel tests',
    () {
      test(
        'When ForecastViewModel is initialized, call the setForecast method',
        () async {
          when(
            () => mockWeatherServices.getForecast(
              httpClient: any(named: 'httpClient'),
            ),
          ).thenAnswer(
            (invocation) async => Success(statusCode: 200, data: mockForecast),
          );

          when(
            () => mockWeatherStorage.saveForecastToStorage(
              forecast: mockForecast,
              sharedPreferences: sharedPreferences,
            ),
          ).thenAnswer(
            (invocation) async => true,
          );

          sut = ForecastViewModel(
            init: true,
            weatherServices: mockWeatherServices,
            weatherStorage: mockWeatherStorage,
          );
        },
      );
      test(
        'When setForecast is called, return the forecast from the API',
        () async {
          when(
            () => mockWeatherServices.getForecast(
              httpClient: any(named: 'httpClient'),
            ),
          ).thenAnswer(
            (invocation) async => Success(statusCode: 200, data: mockForecast),
          );

          when(
            () => mockWeatherStorage.saveForecastToStorage(
              forecast: mockForecast,
              sharedPreferences: sharedPreferences,
            ),
          ).thenAnswer(
            (invocation) async => true,
          );

          Future future = sut.setForecast();
          expect(sut.isLoadingForecast, true);
          await future;

          expect(sut.error, null);
          expect(sut.isLoadingForecast, false);
          expect(sut.forecast, mockForecast);
        },
      );

      test(
        'When setForecast is called, return exception and get the forecast from storage',
        () async {
          when(
            () => mockWeatherServices.getForecast(
              httpClient: any(named: 'httpClient'),
            ),
          ).thenAnswer(
            (invocation) async => const Failure(
                statusCode: 500, message: 'Internal Server Error'),
          );

          when(
            () => mockWeatherStorage.getForecastFromStorage(
              sharedPreferences: sharedPreferences,
            ),
          ).thenAnswer(
            (invocation) async => mockForecast,
          );

          Future future = sut.setForecast();
          expect(sut.isLoadingForecast, true);
          await future;
          expect(sut.error, 'Internal Server Error');
          expect(sut.isLoadingForecast, false);
          expect(sut.forecast, mockForecast);
        },
      );
    },
  );
}
