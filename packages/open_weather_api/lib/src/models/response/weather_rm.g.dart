// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRM _$WeatherRMFromJson(Map<String, dynamic> json) => WeatherRM(
      name: json['name'] as String?,
      country: json['country'] as String?,
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      main: json['main'] as Map<String, dynamic>?,
      dt: json['dt'] as int?,
    );
