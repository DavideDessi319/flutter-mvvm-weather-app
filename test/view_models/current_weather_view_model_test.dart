import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/services/weather_status.dart';
import 'package:weather_app_alpian/view_models/current_weather_view_model.dart';
import 'package:http/http.dart' as http;
import '../test_helpers/mock_classes.dart';
import '../test_helpers/mock_data.dart';

void main() {
  late MockWeatherServices mockWeatherServices;
  late MockWeatherStorage mockWeatherStorage;
  // ignore: unused_local_variable
  late http.Client httpClient;
  late CurrentWeatherViewModel sut;
  late Weather mockCurrentWeather;
  late SharedPreferences sharedPreferences;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(httpClient = http.Client());
    mockCurrentWeather =
        Weather.fromJson(jsonDecode(MockData.currentWeatherJSON));
    mockWeatherServices = MockWeatherServices();
    mockWeatherStorage = MockWeatherStorage();
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    sut = CurrentWeatherViewModel(
      init: false,
      weatherServices: mockWeatherServices,
      weatherStorage: mockWeatherStorage,
    );
  });

  group(
    'CurrentWeatherViewModel tests',
    () {
      test(
        'When CurrentWeatherViewModel is initialized, call the setCurrentWeather method',
        () async {
          when(
            () => mockWeatherServices.getCurrentWeather(
              httpClient: any(named: 'httpClient'),
            ),
          ).thenAnswer(
            (invocation) async =>
                Success(statusCode: 200, data: mockCurrentWeather),
          );

          when(
            () => mockWeatherStorage.saveCurrentWeatherToStorage(
              weather: mockCurrentWeather,
              sharedPreferences: sharedPreferences,
            ),
          ).thenAnswer(
            (invocation) async => true,
          );

          sut = CurrentWeatherViewModel(
            init: true,
            weatherServices: mockWeatherServices,
            weatherStorage: mockWeatherStorage,
          );
        },
      );

      test(
        'When setCurrentWeather is called, return the current weather from the API',
        () async {
          when(
            () => mockWeatherServices.getCurrentWeather(
              httpClient: any(named: 'httpClient'),
            ),
          ).thenAnswer(
            (invocation) async =>
                Success(statusCode: 200, data: mockCurrentWeather),
          );

          when(
            () => mockWeatherStorage.saveCurrentWeatherToStorage(
              weather: mockCurrentWeather,
              sharedPreferences: sharedPreferences,
            ),
          ).thenAnswer(
            (invocation) async => true,
          );

          Future future = sut.setCurrentWeather();
          expect(sut.isLoadingCurrentWeather, true);
          await future;
          expect(sut.error, null);
          expect(sut.isLoadingCurrentWeather, false);
          expect(sut.currentWeather, mockCurrentWeather);
        },
      );

      test(
        'When setCurrentWeather is called, return exception and get currentWeather from storage',
        () async {
          when(
            () => mockWeatherServices.getCurrentWeather(
              httpClient: any(named: 'httpClient'),
            ),
          ).thenAnswer(
            (invocation) async => const Failure(
                statusCode: 500, message: 'Internal Server Error'),
          );

          when(
            () => mockWeatherStorage.getCurrentWeatherFromStorage(
              sharedPreferences: sharedPreferences,
            ),
          ).thenAnswer(
            (invocation) async => mockCurrentWeather,
          );

          Future future = sut.setCurrentWeather();
          expect(sut.isLoadingCurrentWeather, true);
          await future;
          expect(sut.error, 'Internal Server Error');
          expect(sut.isLoadingCurrentWeather, false);
          expect(sut.currentWeather, mockCurrentWeather);
        },
      );
    },
  );
}
