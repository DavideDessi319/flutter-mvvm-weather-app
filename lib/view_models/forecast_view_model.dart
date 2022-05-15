import 'package:flutter/material.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/services/weather_service.dart';
import 'package:weather_app_alpian/services/weather_status.dart';

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
  }) {
    _weatherServices = weatherServices;
    _weatherStorage = weatherStorage;
    setForecast();
  }

  bool get isLoadingForecast => _isLoadingForecast;
  String? get error => _error;
  List<Weather> get forecast => _forecast;

  void setIsLoadingCurrentWeather(bool isLoading) {
    notifyListeners();
  }

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
    Object response = await _weatherServices.getForecast();
    if (response is Success) {
      setError(null);
      _forecast = response.data as List<Weather>;
      await _weatherStorage.saveForecastToStorage(_forecast);
    }
    if (response is Failure) {
      setError(response.message);
      await _getForecastFromStorage();
    }
    setIsLoadingForecast(false);
    return;
  }

  Future<void> _getForecastFromStorage() async {
    List<Weather> storedForecast =
        await _weatherStorage.getForecastFromStorage();
    _forecast = storedForecast;
  }
}
