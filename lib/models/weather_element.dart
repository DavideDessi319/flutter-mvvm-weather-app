import 'package:equatable/equatable.dart';

class WeatherElement extends Equatable {
  // coverage:ignore-start
  // ignore: prefer_const_constructors_in_immutables
  WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  // coverage:ignore-end

  late final int id;
  late final String main;
  late final String description;
  late final String icon;

  WeatherElement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}
