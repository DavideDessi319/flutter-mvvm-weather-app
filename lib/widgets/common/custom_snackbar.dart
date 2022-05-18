import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_alpian/utils/constants.dart';
import 'package:weather_app_alpian/view_models/current_weather_view_model.dart';
import 'package:weather_app_alpian/view_models/forecast_view_model.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final CurrentWeatherViewModel currentWeatherViewModel =
        Provider.of<CurrentWeatherViewModel>(context);
    final ForecastViewModel forecastViewModel =
        Provider.of<ForecastViewModel>(context);

    final bool isVisible = currentWeatherViewModel.error != null ||
        forecastViewModel.error != null;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInBack,
      bottom: isVisible ? 0 : -300,
      left: 0,
      right: 0,
      child: Container(
        key: const Key('custom-snackbar'),
        padding:
            const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 40),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [Constants.lightShadow],
            borderRadius: BorderRadius.circular(16),
          ),
          child: isVisible && currentWeatherViewModel.error != null
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        FontAwesomeIcons.robot,
                        color: Colors.red[300],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Oh snap! Something went wrong...',
                              style: themeData.textTheme.subtitle1!
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              currentWeatherViewModel.error!,
                              style: themeData.textTheme.subtitle2!
                                  .copyWith(color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          currentWeatherViewModel.setError(null);
                          forecastViewModel.setError(null);
                        },
                        child: const Text('Got it'),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
