import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_alpian/services/weather_service.dart';
import 'package:weather_app_alpian/services/weather_storage.dart';
import 'package:weather_app_alpian/utils/theme/custom_theme.dart';
import 'package:weather_app_alpian/utils/ui_states/scroll_state_provider.dart';
import 'package:weather_app_alpian/view_models/current_weather_view_model.dart';
import 'package:weather_app_alpian/view_models/forecast_view_model.dart';
import 'package:weather_app_alpian/views/weather_main_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final WeatherServices weatherService = WeatherServices();
  final WeatherStorage weatherStorage = WeatherStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CurrentWeatherViewModel(
            init: true,
            weatherServices: weatherService,
            weatherStorage: weatherStorage,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ForecastViewModel(
            weatherServices: weatherService,
            weatherStorage: weatherStorage,
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
        theme: CustomTheme.theme(context),
        home: WeatherMainView(),
      ),
    );
  }
}
