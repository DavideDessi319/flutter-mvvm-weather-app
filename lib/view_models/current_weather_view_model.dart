import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/services/weather_service.dart';
import 'package:weather_app_alpian/services/weather_status.dart';
import 'package:weather_app_alpian/services/weather_storage.dart';
import 'package:http/http.dart' as http;

class CurrentWeatherViewModel extends ChangeNotifier {
  bool _isLoadingCurrentWeather = true;
  Weather? _currentWeather;
  String? _error;
  late WeatherServices _weatherServices;
  late WeatherStorage _weatherStorage;

  CurrentWeatherViewModel({
    required WeatherServices weatherServices,
    required WeatherStorage weatherStorage,
    required bool init,
  }) {
    _weatherServices = weatherServices;
    _weatherStorage = weatherStorage;
    if (init) setCurrentWeather();
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
    http.Client httpClient = http.Client();
    Object response =
        await _weatherServices.getCurrentWeather(httpClient: httpClient);
    if (response is Success) {
      setError(null);
      _currentWeather = response.data as Weather;
      _saveCurrentWeatherToStorage();
    }
    if (response is Failure) {
      setError(response.message);
      await _getCurrentWeatherFromStorage();
    }
    setIsLoadingCurrentWeather(false);
  }

  Future<void> _getCurrentWeatherFromStorage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Weather? storedCurrentWeather = await _weatherStorage
        .getCurrentWeatherFromStorage(sharedPreferences: sharedPreferences);
    _currentWeather = storedCurrentWeather;
  }

  Future<void> _saveCurrentWeatherToStorage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await _weatherStorage.saveCurrentWeatherToStorage(
      weather: _currentWeather!,
      sharedPreferences: sharedPreferences,
    );
  }
}
