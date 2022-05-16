import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_alpian/utils/constants.dart';
import 'package:weather_app_alpian/utils/extensions/date_utils_extension.dart';
import 'package:weather_app_alpian/utils/extensions/string_extensions.dart';
import 'package:weather_app_alpian/utils/painters/draggable_sheet_painter.dart';
import 'package:weather_app_alpian/view_models/current_weather_view_model.dart';
import 'package:weather_app_alpian/view_models/forecast_view_model.dart';

class WeatherPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxExtentValue;
  final double minExtentValue;

  WeatherPersistentHeaderDelegate(
      {required this.maxExtentValue, required this.minExtentValue});

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final double scrollPercentage = shrinkOffset / maxExtent;
    final CurrentWeatherViewModel currentWeatherViewModel =
        Provider.of<CurrentWeatherViewModel>(context);
    final ForecastViewModel forecastViewModel =
        Provider.of<ForecastViewModel>(context);

    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: MediaQuery.of(context).size.height,
          child: Container(
            decoration: const BoxDecoration(
              gradient: Constants.sunnyGradient,
            ),
          ),
        ),
        /* Positioned(
          left: 0,
          right: 0,
          bottom: (-100 - scrollPercentage * 150).clamp(-170, -100),
          child: Image.asset(
            'assets/background_images/sunny_background/sunny_background.png',
            fit: BoxFit.cover,
          ),
        ), */
        Positioned(
          left: 0,
          right: 0,
          bottom: (-80 - scrollPercentage * 200).clamp(-200, -80),
          child: Image.asset(
            'assets/background_images/sunny_background/sunny_midground.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: (-50 - scrollPercentage * 100).clamp(-100, -50),
          child: Image.asset(
            'assets/background_images/sunny_background/sunny_foreground.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: MediaQuery.of(context).size.height,
          child: Opacity(
            opacity: (0 + (scrollPercentage * (scrollPercentage * 1.5)))
                .clamp(0, 0.8),
            child: Container(
              decoration: BoxDecoration(
                color: Constants.sunnyGradient.colors[2],
              ),
            ),
          ),
        ),
        SafeArea(
          bottom: false,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              //Location and Last Update Section
              Positioned(
                top: 16,
                left: 16,
                child: Opacity(
                  opacity: (1 - scrollPercentage * 3).clamp(0, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.white,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            currentWeatherViewModel.currentWeather!.name
                                .toString(),
                            style: textTheme.headline6,
                          ),
                        ],
                      ),
                      Text(
                        DateUtilsExtension.timestampToFormattedString(
                            currentWeatherViewModel.currentWeather!.dt),
                        style: textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
              ),
              // Update data button
              Positioned(
                top: 16,
                right: 16,
                child: Opacity(
                  opacity: (1 - scrollPercentage * 4).clamp(0, 1),
                  child: GestureDetector(
                    onTap: () {
                      currentWeatherViewModel.setCurrentWeather();
                      forecastViewModel.setForecast();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: const [Constants.lightShadow],
                      ),
                      child: Row(
                        children: [
                          Lottie.asset(
                            'assets/lottie/refresh_weather.json',
                            width: 20,
                            animate: forecastViewModel.isLoadingForecast,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Refresh',
                            style: textTheme.subtitle1!
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Temperature
              Positioned(
                top: (56 - scrollPercentage * 200).clamp(16, 56),
                left: 16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentWeatherViewModel.currentWeather?.main?.temp
                              .toStringAsFixed(0) ??
                          'N/A',
                      style: textTheme.headline1!.copyWith(
                        foreground: Paint()
                          ..shader = Constants.headlineGradient,
                        fontSize: (120 - scrollPercentage * 100).clamp(50, 120),
                      ),
                    ),
                    Text(
                      'o',
                      style: textTheme.headline4!.copyWith(
                        fontSize: (30 - scrollPercentage * 50).clamp(15, 30),
                      ),
                    ),
                  ],
                ),
              ),
              // Min Temperature
              Positioned(
                top: (200 - scrollPercentage * 220).clamp(40, 200),
                left: (16 + scrollPercentage * 100).clamp(16, 90),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.temperatureArrowDown,
                      color: Colors.blue.withOpacity(0.80),
                      size: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${currentWeatherViewModel.currentWeather?.main?.tempMin.toStringAsFixed(0)}°',
                      style: textTheme.headline5!,
                    ),
                  ],
                ),
              ),
              // Max Temperature
              Positioned(
                top: (200 - scrollPercentage * 220).clamp(40, 200),
                left: (108 + scrollPercentage * 100).clamp(108, 160),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.temperatureArrowUp,
                      color: Colors.red.withOpacity(0.80),
                      size: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${currentWeatherViewModel.currentWeather?.main?.tempMax.toStringAsFixed(0)}°',
                      style: textTheme.headline5!,
                    )
                  ],
                ),
              ),
              // Humidity
              Positioned(
                top: (240 - scrollPercentage * 280).clamp(40, 240),
                left: (16 + scrollPercentage * 290).clamp(16, 230),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.droplet,
                      color: Colors.lightBlue.withOpacity(0.80),
                      size: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${currentWeatherViewModel.currentWeather?.main?.humidity.toStringAsFixed(0)}%',
                      style: textTheme.headline5!,
                    ),
                  ],
                ),
              ),
              // Weather icon
              Positioned(
                top: (40 - scrollPercentage * 120).clamp(8, 40),
                right: (-20 + scrollPercentage * 50).clamp(-20, 8),
                child: Image.network(
                  Constants.OPEN_WEATHER_ICON_URL +
                      currentWeatherViewModel.currentWeather!.weather[0].icon +
                      Constants.OPEN_WEATHER_ICON_SUFFIX,
                  width: (200 - scrollPercentage * 200).clamp(80, 200),
                  errorBuilder: (_, __, ___) {
                    return const SizedBox();
                  },
                ),
              ),
              // Weather description
              Positioned(
                right: 32,
                top: 208,
                child: Opacity(
                  opacity: (1 - scrollPercentage * 3).clamp(0, 1),
                  child: Text(
                    currentWeatherViewModel
                        .currentWeather!.weather[0].description
                        .capitalize(),
                    style: textTheme.headline6,
                  ),
                ),
              ),
              // Bottom sheet dragger
              Positioned(
                bottom: -10,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 60,
                  child: CustomPaint(
                    painter: DraggableSheetPainter(),
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 24),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => maxExtentValue;

  @override
  double get minExtent => minExtentValue;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
