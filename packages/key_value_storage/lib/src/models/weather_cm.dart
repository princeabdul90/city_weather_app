/*
* Developer: Abubakar Abdullahi
* Date: 04/03/2023
*/
import 'package:hive/hive.dart';

part 'weather_cm.g.dart';

@HiveType(typeId: 0)
class WeatherCM {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String country;
  @HiveField(3)
  final String icon;
  @HiveField(4)
  final double temp;
  @HiveField(5)
  final double tempMin;
  @HiveField(6)
  final double tempMax;
  @HiveField(7)
  final DateTime? lastUpdated;

  const WeatherCM({
    required this.name,
    required this.description,
    required this.country,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    this.lastUpdated,
  });
}
