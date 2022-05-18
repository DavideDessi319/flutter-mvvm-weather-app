import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_alpian/helpers/forecast_helper.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/services/weather_status.dart';
import 'package:weather_app_alpian/utils/ui_states/scroll_state_provider.dart';
import 'package:weather_app_alpian/view_models/current_weather_view_model.dart';
import 'package:weather_app_alpian/view_models/forecast_view_model.dart';
import 'package:weather_app_alpian/views/weather_main_view.dart';
import '../test_helpers/mock_classes.dart';
import '../test_helpers/mock_data.dart';
import 'package:http/http.dart' as http;

class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

void main() {
  CustomBindings();

  late MockWeatherServices mockWeatherServices;
  late MockWeatherStorage mockWeatherStorage;
  late Weather mockCurrentWeather;
  late List<Weather> mockForecast;
  late http.Client httpClient;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: '.env');
    registerFallbackValue(httpClient = http.Client());
    mockWeatherServices = MockWeatherServices();
    mockWeatherStorage = MockWeatherStorage();
    mockCurrentWeather = Weather.fromJson(
      jsonDecode(MockData.currentWeatherJSON),
    );
    mockForecast = Weather.weatherListFromJson(
      jsonDecode(MockData.forecastJSON)['list'],
    );
    mockForecast = ForecastHepler.groupForecastByDate(mockForecast);
  });

  Widget createWUT() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CurrentWeatherViewModel(
            init: true,
            weatherServices: mockWeatherServices,
            weatherStorage: mockWeatherStorage,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ForecastViewModel(
            weatherServices: mockWeatherServices,
            weatherStorage: mockWeatherStorage,
            init: true,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ScrollStateProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: WeatherMainView(),
      ),
    );
  }

  // Loading View testing
  /* testWidgets(
      'When current weather or forecast data is loading, return the loading screen',
      (WidgetTester tester) async {
    when(
      () => mockWeatherServices.getCurrentWeather(
        httpClient: any(named: 'httpClient'),
      ),
    ).thenAnswer((invocation) async {
      await Future.delayed(const Duration(seconds: 2));
      return Success(statusCode: 200, data: mockCurrentWeather);
    });
    when(
      () => mockWeatherServices.getForecast(
        httpClient: any(named: 'httpClient'),
      ),
    ).thenAnswer((invocation) async {
      await Future.delayed(const Duration(seconds: 2));
      return Success(statusCode: 200, data: mockForecast);
    });

    await tester.pumpWidget(createWUT());
    await tester.pump(const Duration(milliseconds: 800));
    expect(find.byKey(const Key('loading-view')), findsOneWidget);
    await tester.pumpAndSettle();
  });
 */
  testWidgets(
      'When current weather or forecast data are loaded, return the main view containing the CurrentWeatherSectionView and the ForecastSectionView',
      (WidgetTester tester) async {
    //initHttpClientReturn();
    when(
      () => mockWeatherServices.getCurrentWeather(
        httpClient: any(named: 'httpClient'),
      ),
    ).thenAnswer((invocation) async {
      return Success(statusCode: 200, data: mockCurrentWeather);
    });
    when(
      () => mockWeatherServices.getForecast(
        httpClient: any(named: 'httpClient'),
      ),
    ).thenAnswer((invocation) async {
      return Success(statusCode: 200, data: mockForecast);
    });

    await tester.pumpWidget(createWUT());
    await tester.pump();
    expect(find.byKey(const Key('current-weather-section')), findsOneWidget);
    expect(find.byKey(const Key('forecast-section')), findsOneWidget);
  });

  /* testWidgets(
      'When there is no internet connection, return the stored data and show the CustomSnackbar with the error message',
      (WidgetTester tester) async {
    //initHttpClientReturn();
    when(
      () => mockWeatherServices.getCurrentWeather(
        httpClient: any(named: 'httpClient'),
      ),
    ).thenThrow(const SocketException('No internet connection'));
    when(
      () => mockWeatherServices.getForecast(
        httpClient: any(named: 'httpClient'),
      ),
    ).thenThrow(const SocketException('No internet connection'));

    await tester.pumpWidget(createWUT());
    await tester.pump();
    expect(find.byKey(const Key('custom-snackbar')), findsOneWidget);
  }); */
}
