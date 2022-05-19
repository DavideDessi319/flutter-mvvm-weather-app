import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/utils/constants.dart';
import 'package:weather_app_alpian/utils/extensions/date_utils_extension.dart';
import 'package:weather_app_alpian/utils/ui_states/scroll_state_provider.dart';

class ForecastCard extends StatefulWidget {
  final Weather weather;
  final int index;
  const ForecastCard({Key? key, required this.weather, required this.index})
      : super(key: key);

  @override
  State<ForecastCard> createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late Animation _slideAnimation;

  @override
  void initState() {
    super.initState();
    _slideAnimationController = AnimationController(
      duration: Duration(milliseconds: 1200 + widget.index * 100),
      reverseDuration: Duration(milliseconds: 1000 + widget.index * 80),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: -180.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _slideAnimationController,
        curve: Curves.elasticInOut,
      ),
    )..addListener(() {
        setState(() {});
      });
    _slideAnimationController.forward();
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ScrollStateProvider scrollStateProvider =
        Provider.of<ScrollStateProvider>(context);
    if (scrollStateProvider.isSliverThresholdScrolled &&
        _slideAnimationController.isCompleted) {
      _slideAnimationController.reverse();
    }
    if (!scrollStateProvider.isSliverThresholdScrolled &&
        _slideAnimationController.isDismissed) {
      _slideAnimationController.forward();
    }
    return Transform.translate(
      offset: Offset(0, _slideAnimation.value),
      child: AnimatedOpacity(
        key: Key('forecast-card-${widget.index}-opacity'),
        duration: const Duration(milliseconds: 1000),
        opacity: scrollStateProvider.isSliverThresholdScrolled ? 0 : 1,
        curve: const Interval(0.6, 1, curve: Curves.decelerate),
        child: Column(
          children: [
            Image.network(
              Constants.openWeatherIconURL! +
                  widget.weather.weather[0].icon +
                  Constants.openWeatherIconSuffix,
              width: 60,
              errorBuilder: (_, __, ___) {
                return const SizedBox();
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              DateUtilsExtension.timestampToDayOfWeek(widget.weather.dt),
              style: textTheme.subtitle2,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.weather.main?.temp.toStringAsFixed(0) ?? '',
                  style: textTheme.headline4!.copyWith(color: Colors.black),
                ),
                Text(
                  '°',
                  style: textTheme.headline5!.copyWith(color: Colors.black),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
