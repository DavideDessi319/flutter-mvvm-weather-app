import 'package:equatable/equatable.dart';
import 'package:weather_app_alpian/models/main.dart';
import 'package:weather_app_alpian/models/weather_element.dart';

class Weather extends Equatable {
  late final List<WeatherElement> weather;
  late final String name;
  late final Main? main;
  late final int dt;

  // coverage:ignore-start
  // ignore: prefer_const_constructors_in_immutables
  Weather({
    required this.weather,
    required this.main,
    required this.dt,
    required this.name,
  });
  // coverage:ignore-end

  Weather.fromJson(Map<String, dynamic> json) {
    weather = List.from(json['weather'])
        .map((e) => WeatherElement.fromJson(e))
        .toList();
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    name = json['name'] ?? '';
    dt = json['dt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['weather'] = weather.map((e) => e.toJson()).toList();
    data['main'] = main?.toJson();
    data['dt'] = dt;
    data['name'] = name;
    return data;
  }

  static List<Weather> weatherListFromJson(dynamic response) =>
      List<Weather>.from(
        response.map(
          (weather) => Weather.fromJson(weather),
        ),
      );

  @override
  List<Object?> get props => [
        weather,
        main,
        dt,
        name,
      ];
}
