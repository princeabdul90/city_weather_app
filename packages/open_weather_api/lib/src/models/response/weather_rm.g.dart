// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRM _$WeatherRMFromJson(Map<String, dynamic> json) => WeatherRM(
      name: json['name'] as String?,
      description: json['description'] as String?,
      country: json['country'] as String?,
      icon: json['icon'] as String?,
      temp: (json['temp'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
    );
