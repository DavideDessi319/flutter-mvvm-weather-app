import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_alpian/utils/constants.dart';
import 'package:weather_app_alpian/utils/draggable_sheet_painter.dart';
import 'package:weather_app_alpian/widgets/forecast_card.dart';

class WeatherMainView extends StatelessWidget {
  const WeatherMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final Size displaySize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            delegate: WeatherPersistentHeaderDelegate(
              maxExtentValue: 600,
              minExtentValue: 170,
            ),
            pinned: true,
            floating: false,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: displaySize.height * 0.8,
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Weather Forecast',
                    style: textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ForecastCard(),
                      ForecastCard(),
                      ForecastCard(),
                      ForecastCard(),
                      ForecastCard(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxExtentValue;
  final double minExtentValue;

  WeatherPersistentHeaderDelegate(
      {required this.maxExtentValue, required this.minExtentValue});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final double scrollPercentage = shrinkOffset / maxExtent;
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
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: MediaQuery.of(context).size.height,
          child: Opacity(
            opacity: (0 + scrollPercentage * 1.2).clamp(0, 1),
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
                            'London',
                            style: textTheme.headline6,
                          ),
                        ],
                      ),
                      Text(
                        'Oct 18, 5:10AM',
                        style: textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: (56 - scrollPercentage * 200).clamp(-24, 56),
                left: (16 + scrollPercentage * 100).clamp(16, 34),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Transform.scale(
                      scale: (1 - scrollPercentage * 1.3).clamp(0.5, 1),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '23',
                            style: textTheme.headline1!.copyWith(
                                foreground: Paint()
                                  ..shader = Constants.headlineGradient),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              'o',
                              style: textTheme.headline4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: (-32 + scrollPercentage * 200).clamp(-32, 60),
                      left: (0 - scrollPercentage * 200).clamp(-10, 0),
                      child: SizedBox(
                        width: (120 + scrollPercentage * 100).clamp(120, 170),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Min',
                                  style: textTheme.subtitle1!.copyWith(
                                    color: Colors.lightBlue,
                                  ),
                                ),
                                Text('17°', style: textTheme.headline4!),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Max',
                                  style: textTheme.subtitle1!.copyWith(
                                    color: Colors.redAccent,
                                  ),
                                ),
                                Text(
                                  '26°',
                                  style: textTheme.headline4!,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: (100 - scrollPercentage * 200).clamp(18, 100),
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      CupertinoIcons.sun_max,
                      color: Colors.white,
                      size: (60 - scrollPercentage * 100).clamp(40, 60),
                    ),
                    Text(
                      'It\'s Sunny!',
                      style: textTheme.headline6,
                    ),
                  ],
                ),
              ),
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
