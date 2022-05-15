import 'package:flutter/material.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/services/weather_service.dart';
import 'package:weather_app_alpian/services/weather_status.dart';
import 'package:weather_app_alpian/services/weather_storage.dart';

class CurrentWeatherViewModel extends ChangeNotifier {
  bool _isLoadingCurrentWeather = true;
  Weather? _currentWeather;
  String? _error;
  late WeatherServices _weatherServices;
  late WeatherStorage _weatherStorage;

  CurrentWeatherViewModel({
    required WeatherServices weatherServices,
    required WeatherStorage weatherStorage,
  }) {
    _weatherServices = weatherServices;
    _weatherStorage = weatherStorage;
    setCurrentWeather();
  }

  bool get isLoadingCurrentWeather => _isLoadingCurrentWeather;
  String? get error => _error;
  Weather? get currentWeather => _currentWeather;

  void setIsLoadingCurrentWeather(bool isLoading) {
    _isLoadingCurrentWeather = isLoading;
    notifyListeners();
  }

  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  Future<void> setCurrentWeather() async {
    setIsLoadingCurrentWeather(true);
    Object response = await _weatherServices.getCurrentWeather();
    if (response is Success) {
      setError(null);
      _currentWeather = response.data as Weather;
      await _weatherStorage.saveCurrentWeatherToStorage(_currentWeather!);
    }
    if (response is Failure) {
      setError(response.message);
      await _getCurrentWeatherFromStorage();
    }
    setIsLoadingCurrentWeather(false);
  }

  Future<void> _getCurrentWeatherFromStorage() async {
    Weather? storedCurrentWeather =
        await _weatherStorage.getCurrentWeatherFromStorage();
    _currentWeather = storedCurrentWeather;
  }
}
