import 'package:mocktail/mocktail.dart';
import 'package:weather_app_alpian/services/weather_service.dart';
import 'package:weather_app_alpian/services/weather_storage.dart';
import 'package:http/http.dart' as http;

class MockWeatherServices extends Mock implements WeatherServices {}

class MockWeatherStorage extends Mock implements WeatherStorage {}

class MockHTTPClient extends Mock implements http.Client {}
