import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_alpian/helpers/current_weather_helper.dart';
import 'package:weather_app_alpian/models/background.dart';
import 'package:weather_app_alpian/utils/constants.dart';

void main() {
  test('When the status is "Clear", return the sunny Background', () {
    Background background = const Background(
      backgroundGradient: Constants.cloudyGradient,
      backgroundImagePath: 'sunny_background/sunny_background.png',
      midgroundImagePath: 'sunny_background/sunny_midground.png',
      foregroundImagePath: 'sunny_background/sunny_foreground.png',
    );
    expect(
      CurrentWeatherHelper.getCurrentWeatherBackground(weatherStatus: 'Clear'),
      background,
    );
  });

  test('When the status is "Clouds", return the cloudy Background', () {
    Background background = const Background(
      backgroundGradient: Constants.cloudyGradient,
      backgroundImagePath: 'cloudy_background/cloudy_background.png',
      midgroundImagePath: 'cloudy_background/cloudy_midground.png',
      foregroundImagePath: 'cloudy_background/cloudy_foreground.png',
    );
    expect(
      CurrentWeatherHelper.getCurrentWeatherBackground(weatherStatus: 'Clouds'),
      background,
    );
  });

  test('When the status is "Drizzle", return the cloudy Background', () {
    Background background = const Background(
      backgroundGradient: Constants.cloudyGradient,
      backgroundImagePath: 'cloudy_background/cloudy_background.png',
      midgroundImagePath: 'cloudy_background/cloudy_midground.png',
      foregroundImagePath: 'cloudy_background/cloudy_foreground.png',
    );
    expect(
      CurrentWeatherHelper.getCurrentWeatherBackground(
          weatherStatus: 'Drizzle'),
      background,
    );
  });

  test('When the status is "Snow", return the cloudy Background', () {
    Background background = const Background(
      backgroundGradient: Constants.cloudyGradient,
      backgroundImagePath: 'cloudy_background/cloudy_background.png',
      midgroundImagePath: 'cloudy_background/cloudy_midground.png',
      foregroundImagePath: 'cloudy_background/cloudy_foreground.png',
    );
    expect(
      CurrentWeatherHelper.getCurrentWeatherBackground(weatherStatus: 'Snow'),
      background,
    );
  });

  test('When the status is "Rain", return the rainy Background', () {
    Background background = const Background(
      backgroundGradient: Constants.rainyGradient,
      backgroundImagePath: 'rainy_background/rainy_background.png',
      midgroundImagePath: 'rainy_background/rainy_midground.png',
      foregroundImagePath: 'rainy_background/rainy_foreground.png',
    );
    expect(
      CurrentWeatherHelper.getCurrentWeatherBackground(weatherStatus: 'Rain'),
      background,
    );
  });

  test('When the status is "Thunderstorm", return the rainy Background', () {
    Background background = const Background(
      backgroundGradient: Constants.rainyGradient,
      backgroundImagePath: 'rainy_background/rainy_background.png',
      midgroundImagePath: 'rainy_background/rainy_midground.png',
      foregroundImagePath: 'rainy_background/rainy_foreground.png',
    );
    expect(
      CurrentWeatherHelper.getCurrentWeatherBackground(
          weatherStatus: 'Thunderstorm'),
      background,
    );
  });

  test('When the status is a not included value, return the cloudy Background',
      () {
    Background background = const Background(
      backgroundGradient: Constants.cloudyGradient,
      backgroundImagePath: 'cloudy_background/cloudy_background.png',
      midgroundImagePath: 'cloudy_background/cloudy_midground.png',
      foregroundImagePath: 'cloudy_background/cloudy_foreground.png',
    );
    expect(
      CurrentWeatherHelper.getCurrentWeatherBackground(weatherStatus: 'Haze'),
      background,
    );
  });
}
