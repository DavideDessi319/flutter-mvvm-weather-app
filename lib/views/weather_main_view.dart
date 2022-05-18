import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_alpian/utils/ui_states/scroll_state_provider.dart';
import 'package:weather_app_alpian/view_models/current_weather_view_model.dart';
import 'package:weather_app_alpian/view_models/forecast_view_model.dart';
import 'package:weather_app_alpian/views/forecast_section_view.dart';
import 'package:weather_app_alpian/views/loading_view.dart';
import 'package:weather_app_alpian/views/current_weather_section_view.dart';
import 'package:weather_app_alpian/widgets/common/custom_snackbar.dart';

class WeatherMainView extends StatelessWidget {
  WeatherMainView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final CurrentWeatherViewModel currentWeatherViewModel =
        Provider.of<CurrentWeatherViewModel>(context);
    final ForecastViewModel forecastViewModel =
        Provider.of<ForecastViewModel>(context);
    final ScrollStateProvider scrollStateProvider =
        Provider.of<ScrollStateProvider>(context);
    final Size displaySize = MediaQuery.of(context).size;

    if ((currentWeatherViewModel.isLoadingCurrentWeather ||
            forecastViewModel.isLoadingForecast) &&
        currentWeatherViewModel.currentWeather == null) {
      return const LoadingView();
    }

    return Scaffold(
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (value) {
              if (value.metrics.pixels >= 90 &&
                  scrollStateProvider.isSliverThresholdScrolled == false) {
                scrollStateProvider.setIsSliverThresholdScrolled(true);
              }
              if (value.metrics.pixels < 10 &&
                  scrollStateProvider.isSliverThresholdScrolled == true) {
                scrollStateProvider.setIsSliverThresholdScrolled(false);
              }
              return true;
            },
            child: TweenAnimationBuilder(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                tween: Tween<double>(begin: 0.3, end: 1),
                builder: (context, double value, __) {
                  return Opacity(
                    opacity: value,
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverPersistentHeader(
                          delegate: CurrentWeatherSectionView(
                            maxExtentValue: displaySize.height * 0.70,
                            minExtentValue: 170,
                          ),
                          pinned: true,
                          floating: false,
                        ),
                        const SliverToBoxAdapter(
                          child: ForecastSectionView(),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          CustomSnackbar(
            isVisible: currentWeatherViewModel.error != null ||
                forecastViewModel.error != null,
            errorMessage: currentWeatherViewModel.error,
          )
        ],
      ),
    );
  }
}
