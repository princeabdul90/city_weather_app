/*
* Developer: Abubakar Abdullahi
* Date: 28/02/2023
*/

import 'package:json_annotation/json_annotation.dart';

import '../custom_converter/date_time_converter.dart';

part 'weather_rm.g.dart';

@JsonSerializable(createToJson: false)
class WeatherRM {
  final String? name;
  final String? country;
  final List<Map>? weather;
  final Map? main;


  const WeatherRM({
    this.name,
    this.country,
    this.weather,
    this.main,
  });

  factory WeatherRM.fromJson(Map<String, dynamic> json) =>
      _$WeatherRMFromJson(json);

  WeatherRM copyWith({
    String? name,
    String? country,
    List<Map>? weather,
    Map? main,
  }) {
    return WeatherRM(
      name: name ?? this.name,
      country: country ?? this.country,
      weather: weather ?? this.weather,
      main: main ?? this.main,
    );
  }
}
