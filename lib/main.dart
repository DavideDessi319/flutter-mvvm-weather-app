import 'package:flutter/material.dart';
import 'package:weather_app_alpian/utils/custom_theme.dart';
import 'package:weather_app_alpian/views/weather_main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.theme(context),
      home: const WeatherMainView(),
    );
  }
}
