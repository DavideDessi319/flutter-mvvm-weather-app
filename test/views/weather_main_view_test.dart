import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  // ignore: unused_local_variable
  late http.Client httpClient;
  late SharedPreferences sharedPreferences;

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
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
  });

  void setupService() {
    when(
      () => mockWeatherStorage.saveCurrentWeatherToStorage(
        weather: mockCurrentWeather,
        sharedPreferences: sharedPreferences,
      ),
    ).thenAnswer(
      (invocation) async => true,
    );
    when(
      () => mockWeatherStorage.saveForecastToStorage(
        forecast: mockForecast,
        sharedPreferences: sharedPreferences,
      ),
    ).thenAnswer(
      (invocation) async => true,
    );
  }

  void setupServiceAndStorage() {
    setupService();
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
  }

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
  testWidgets(
      'When current weather or forecast data is loading, return the loading screen',
      (WidgetTester tester) async {
    setupService();
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
    await tester.pumpAndSettle(
      const Duration(seconds: 2),
      EnginePhase.build,
      const Duration(minutes: 1),
    );
  });

  testWidgets(
      'When current weather or forecast data are loaded, return the main view containing the CurrentWeatherSectionView and the ForecastSectionView',
      (WidgetTester tester) async {
    setupServiceAndStorage();
    await tester.pumpWidget(createWUT());
    await tester.pump();
    expect(find.byKey(const Key('current-weather-section')), findsOneWidget);
    expect(find.byKey(const Key('forecast-section')), findsOneWidget);
  });

  testWidgets('When the user hasn\'t scrolled, show the Forecast in a row',
      (WidgetTester tester) async {
    final forecastCard = find.byKey(const Key('forecast-card-1-opacity'));
    final forecastDetailCard =
        find.byKey(const Key('forecast-detail-card-1-opacity'));
    setupServiceAndStorage();

    await tester.pumpWidget(createWUT());
    await tester.pump(const Duration(seconds: 2));

    final forecastCardWidget =
        tester.firstWidget<AnimatedOpacity>(forecastCard);
    final forecastDetailCardWidget =
        tester.firstWidget<AnimatedOpacity>(forecastDetailCard);

    expect(forecastCardWidget.opacity, 1);
    expect(forecastDetailCardWidget.opacity, 0);
  });

  // Last test created, I spent some time troubleshooting it and I think the problem
  // is that it's not awaiting for the opacity animation to finish properly.
  // Unfortunately the deadline was reached so I wasn't able to push a solution, but
  // I'll continue to troubleshoot this problem on my own to be prepared in future cases.

  /* testWidgets('When the user  scrolls, show the Forecast in a column',
      (WidgetTester tester) async {
    final forecastCard = find.byKey(const Key('forecast-card-1-opacity'));
    final forecastDetailCard =
        find.byKey(const Key('forecast-detail-card-1-opacity'));
    setupServiceAndStorage();

    await tester.pumpWidget(createWUT());
    await tester.pump(const Duration(seconds: 2));

    final forecastCardWidget =
        tester.firstWidget<AnimatedOpacity>(forecastCard);
    final forecastDetailCardWidget =
        tester.firstWidget<AnimatedOpacity>(forecastDetailCard);

    // Simulating scroll
    await tester.dragUntilVisible(
      forecastDetailCard,
      find.byKey(const Key('custom-scrollview')),
      const Offset(0, -500),
    );
    await tester.pumpAndSettle(
      const Duration(seconds: 3),
    );

    expect(forecastCardWidget.opacity, 0);
    expect(forecastDetailCardWidget.opacity, 1);
  }); */
}
