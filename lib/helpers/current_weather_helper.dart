import 'package:weather_app_alpian/models/background.dart';
import 'package:weather_app_alpian/utils/constants.dart';

class CurrentWeatherHelper {
  static Background getCurrentWeatherBackground(
      {required String weatherStatus}) {
    Background background;

    if (DateTime.now().hour >= 19) {
      return background = const Background(
        backgroundGradient: Constants.nightGradient,
        backgroundImagePath: 'night_background/night_background.png',
        midgroundImagePath: 'night_background/night_midground.png',
        foregroundImagePath: 'night_background/night_foreground.png',
      );
    }

    switch (weatherStatus.toLowerCase()) {
      case 'thunderstorm':
      case 'rain':
        background = const Background(
          backgroundGradient: Constants.rainyGradient,
          backgroundImagePath: 'rainy_background/rainy_background.png',
          midgroundImagePath: 'rainy_background/rainy_midground.png',
          foregroundImagePath: 'rainy_background/rainy_foreground.png',
        );
        break;
      case 'clear':
        background = const Background(
          backgroundGradient: Constants.cloudyGradient,
          backgroundImagePath: 'sunny_background/sunny_background.png',
          midgroundImagePath: 'sunny_background/sunny_midground.png',
          foregroundImagePath: 'sunny_background/sunny_foreground.png',
        );
        break;
      case 'clouds':
      case 'drizzle':
      case 'snow':
      default:
        background = const Background(
          backgroundGradient: Constants.cloudyGradient,
          backgroundImagePath: 'cloudy_background/cloudy_background.png',
          midgroundImagePath: 'cloudy_background/cloudy_midground.png',
          foregroundImagePath: 'cloudy_background/cloudy_foreground.png',
        );
        break;
    }
    return background;
  }
}
