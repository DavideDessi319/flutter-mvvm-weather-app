import 'package:collection/collection.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/utils/extensions/date_utils_extension.dart';

class ForecastHepler {
  static List<Weather> groupForecastByDate(List<Weather> forecast) {
    try {
      List<Weather> aggregatedForecast = [];
      Map<dynamic, List<Weather>> groupedForecast = groupBy(
        forecast,
        (weather) => DateUtilsExtension.timestampToStringDate(weather.dt),
      );

      for (List<Weather> forecastGroup in groupedForecast.values) {
        aggregatedForecast.add(forecastGroup.first);
      }

      // Removing the first element as it's the same as the current weather
      aggregatedForecast.removeAt(0);

      return aggregatedForecast;
    } catch (error) {
      return [];
    }
  }
}
