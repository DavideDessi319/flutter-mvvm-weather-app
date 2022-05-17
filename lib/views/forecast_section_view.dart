import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_alpian/utils/native/method_channels.dart';
import 'package:weather_app_alpian/utils/ui_states/scroll_state_provider.dart';
import 'package:weather_app_alpian/view_models/forecast_view_model.dart';
import 'package:weather_app_alpian/widgets/forecast/forecast_card.dart';
import 'package:weather_app_alpian/widgets/forecast/forecast_datail_card.dart';

class ForecastSectionView extends StatelessWidget {
  const ForecastSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ForecastViewModel forecastViewModel =
        Provider.of<ForecastViewModel>(context);
    final ScrollStateProvider scrollStateProvider =
        Provider.of<ScrollStateProvider>(context);
    final Size displaySize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      constraints: BoxConstraints(minHeight: displaySize.height * 0.85),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Weather Forecast',
            style: textTheme.headline5!.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 12,
          ),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: forecastViewModel.forecast.map(
                  (weather) {
                    int weatherIndex =
                        forecastViewModel.forecast.indexOf(weather);
                    return ForecastCard(
                      weather: weather,
                      index: weatherIndex,
                    );
                  },
                ).toList(),
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: forecastViewModel.forecast.length,
                itemBuilder: (context, index) {
                  return ForecastDetailCard(
                    weather: forecastViewModel.forecast[index],
                    index: index,
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'The weather data are provided by the OpenWeatherMap API',
              textAlign: TextAlign.center,
              style: textTheme.subtitle1!.copyWith(color: Colors.grey[500]),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CupertinoButton.filled(
            onPressed: () => MethodChannels.callNativeWebView(),
            child: Text('Tap to see the map of your zone',
                textAlign: TextAlign.center, style: textTheme.subtitle1!),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
