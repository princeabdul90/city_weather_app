/*
* Developer: Abubakar Abdullahi
* Date: 01/03/2023
*/


import 'package:flutter/material.dart';


class Weather {
  final String name;
  final String description;
  final String country;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final DateTime? lastUpdated;

  const Weather({
    required this.name,
    required this.country,
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    this.lastUpdated,
  });

  @override
  List<Object> get props =>
      [name, country, description, icon, temp, tempMin, tempMax, ];

  Weather copyWith({
    String? name,
    String? description,
    String? country,
    String? icon,
    double? temp,
    double? tempMin,
    double? tempMax,
    DateTime? lastUpdated,
  }) {
    return Weather(
      name: name ?? this.name,
      description: description ?? this.description,
      country: country ?? this.country,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  factory Weather.initial() => Weather(
    description: 'clear sky',
    country: '',
    name: 'Unknown City',
    temp: 100.0,
    tempMin: 100.0,
    tempMax: 100.0,
    icon: '01d',
    lastUpdated: DateTime.now(),
  );

}