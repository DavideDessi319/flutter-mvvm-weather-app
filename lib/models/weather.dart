import 'dart:convert';

import 'package:weather_app_alpian/models/Coord.dart';
import 'package:weather_app_alpian/models/cloud.dart';
import 'package:weather_app_alpian/models/main.dart';
import 'package:weather_app_alpian/models/sys.dart';
import 'package:weather_app_alpian/models/weather_element.dart';
import 'package:weather_app_alpian/models/wind.dart';

class Weather {
  Weather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });
  late final Coord? coord;
  late final List<WeatherElement> weather;
  late final String? base;
  late final Main? main;
  late final int visibility;
  late final Wind wind;
  late final Clouds clouds;
  late final int dt;
  late final Sys? sys;
  late final int? timezone;
  late final int? id;
  late final String? name;
  late final int? cod;

  Weather.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    weather = List.from(json['weather'])
        .map((e) => WeatherElement.fromJson(e))
        .toList();
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = Wind.fromJson(json['wind']);
    clouds = Clouds.fromJson(json['clouds']);
    dt = json['dt'];
    //sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'] ?? 0;
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    cod = json['cod'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['coord'] = coord?.toJson();
    data['weather'] = weather.map((e) => e.toJson()).toList();
    data['base'] = base;
    data['main'] = main?.toJson();
    data['visibility'] = visibility;
    data['wind'] = wind.toJson();
    data['clouds'] = clouds.toJson();
    data['dt'] = dt;
    data['sys'] = sys?.toJson();
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }

  static List<Weather> weatherListFromJson(dynamic response) =>
      List<Weather>.from(
        response.map(
          (weather) => Weather.fromJson(weather),
        ),
      );

  static String weatherListToJson(List<Weather> data) => json.encode(
        List<dynamic>.from(
          data.map(
            (weather) => weather.toJson(),
          ),
        ),
      );
}
