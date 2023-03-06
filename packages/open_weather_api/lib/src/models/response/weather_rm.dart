/*
* Developer: Abubakar Abdullahi
* Date: 28/02/2023
*/

import 'package:json_annotation/json_annotation.dart';

import '../custom_converter/date_time_converter.dart';

part 'weather_rm.g.dart';

@JsonSerializable(createToJson: false)
class WeatherRM {

  const WeatherRM({
    this.name,
    this.description,
    this.country,
    this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    // required this.lastUpdated,

  });

  final String? name;
  final String? description;
  final String? country;
  final String? icon;
  final double temp;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  // @EpochDateTimeConverter()
  // final DateTime? lastUpdated;



  factory WeatherRM.fromJson(Map<String, dynamic> json) => _$WeatherRMFromJson(json);

  WeatherRM copyWith({
    String? name,
    String? description,
    String? country,
    String? icon,
    double? temp,
    double? tempMin,
    double? tempMax,
   // DateTime? lastUpdated
  }) {
    return WeatherRM(
      name: name ?? this.name,
      description: description ?? this.description,
      country: country ?? this.country,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      // lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}