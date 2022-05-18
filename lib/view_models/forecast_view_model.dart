import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/services/weather_service.dart';
import 'package:weather_app_alpian/services/weather_status.dart';
import 'package:http/http.dart' as http;
import '../services/weather_storage.dart';

class ForecastViewModel extends ChangeNotifier {
  bool _isLoadingForecast = true;
  List<Weather> _forecast = [];
  String? _error;
  late WeatherServices _weatherServices;
  late WeatherStorage _weatherStorage;

  ForecastViewModel({
    required WeatherServices weatherServices,
    required WeatherStorage weatherStorage,
    required bool init,
  }) {
    _weatherServices = weatherServices;
    _weatherStorage = weatherStorage;
    if (init) setForecast();
  }

  bool get isLoadingForecast => _isLoadingForecast;
  String? get error => _error;
  List<Weather> get forecast => _forecast;

  void setIsLoadingForecast(bool isLoading) {
    _isLoadingForecast = isLoading;
    notifyListeners();
  }

  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  Future<void> setForecast() async {
    setIsLoadingForecast(true);
    http.Client httpClient = http.Client();
    Object response =
        await _weatherServices.getForecast(httpClient: httpClient);
    if (response is Success) {
      setError(null);
      _forecast = response.data as List<Weather>;
      await _saveForecastToStorage();
    }
    if (response is Failure) {
      setError(response.message);
      await _getForecastFromStorage();
    }
    setIsLoadingForecast(false);
    return;
  }

  Future<void> _getForecastFromStorage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<Weather> storedForecast = await _weatherStorage.getForecastFromStorage(
      sharedPreferences: sharedPreferences,
    );
    _forecast = storedForecast;
  }

  Future<void> _saveForecastToStorage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await _weatherStorage.saveForecastToStorage(
      forecast: _forecast,
      sharedPreferences: sharedPreferences,
    );
  }
}
