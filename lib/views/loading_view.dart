import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utils/constants.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size displaySize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
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
          Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Lottie.asset(
                'assets/lottie/loading_weather.json',
                width: displaySize.width * 0.8,
              ),
            ],
          )
        ],
      ),
    );
  }
}
