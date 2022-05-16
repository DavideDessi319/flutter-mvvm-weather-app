import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_alpian/models/weather.dart';
import 'package:weather_app_alpian/utils/constants.dart';
import 'package:weather_app_alpian/utils/extensions/date_utils_extension.dart';
import 'package:weather_app_alpian/utils/extensions/string_extensions.dart';
import 'package:weather_app_alpian/utils/ui_states/scroll_state_provider.dart';

class ForecastDetailCard extends StatefulWidget {
  final Weather weather;
  final int index;
  const ForecastDetailCard(
      {Key? key, required this.weather, required this.index})
      : super(key: key);

  @override
  State<ForecastDetailCard> createState() => _ForecastDetailCardState();
}

class _ForecastDetailCardState extends State<ForecastDetailCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late Animation _slideAnimation;

  @override
  void initState() {
    super.initState();
    _slideAnimationController = AnimationController(
      duration: Duration(milliseconds: 400 + widget.index * 200),
      reverseDuration: Duration(milliseconds: 800 + widget.index * 100),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 0, end: -600.0).animate(
      CurvedAnimation(
        parent: _slideAnimationController,
        curve: Curves.easeIn,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _slideAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ScrollStateProvider scrollStateProvider =
        Provider.of<ScrollStateProvider>(context);
    if (scrollStateProvider.isSliverThresholdScrolled) {
      _slideAnimationController.reverse();
    }
    if (!scrollStateProvider.isSliverThresholdScrolled) {
      _slideAnimationController.forward();
    }
    return Transform.translate(
      offset: Offset(_slideAnimation.value, 0),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 1000),
        opacity: scrollStateProvider.isSliverThresholdScrolled ? 1 : 0,
        curve: const Interval(0.6, 1, curve: Curves.easeInToLinear),
        child: Container(
          constraints: const BoxConstraints(minHeight: 80),
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [Constants.lightShadow],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateUtilsExtension.timestampToDayOfWeek(widget.weather.dt),
                style: textTheme.bodyText1!.copyWith(color: Colors.black),
              ),
              Row(
                children: [
                  Image.network(
                    Constants.OPEN_WEATHER_ICON_URL +
                        widget.weather.weather[0].icon +
                        Constants.OPEN_WEATHER_ICON_SUFFIX,
                    width: 65,
                    errorBuilder: (_, __, ___) {
                      return const SizedBox();
                    },
                  ),
                  SizedBox(
                    width: 70,
                    child: Text(
                      widget.weather.weather[0].description.capitalize(),
                      style: textTheme.bodyText1!.copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.weather.main?.temp.toStringAsFixed(0) ?? '',
                        style: textTheme.headline4!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '°',
                        style: textTheme.headline5!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Text(
                        'L: ${widget.weather.main?.tempMax.toStringAsFixed(0)}°',
                        style: textTheme.bodyText1!.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'H: ${widget.weather.main?.tempMax.toStringAsFixed(0)}°',
                        style: textTheme.bodyText1!.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
