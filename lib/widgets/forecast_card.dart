import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Container(
      child: Column(
        children: [
          const Icon(
            CupertinoIcons.cloud_bolt,
            size: 35,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Monday',
            style: textTheme.subtitle2,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '20',
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
    );
  }
}
