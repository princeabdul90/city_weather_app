/*
* Developer: Abubakar Abdullahi
* Date: 02/03/2023
*/

import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:settings/settings.dart';
import 'package:weather/weather.dart';
import 'package:weather_repository/weather_repository.dart';

Map<String, PageBuilder> buildRoutingTable ({
  required RoutemasterDelegate routerDelegate,
  required WeatherRepository weatherRepository,
}) {
  return {
    _PathConstants.weatherScreenPath: (_) => MaterialPage(
      name: 'weather-page',
      child: WeatherScreen(
        weatherRepository: weatherRepository,
        onTappedSetting: () {
          routerDelegate.push(
            _PathConstants.settingScreenPath,
          );
        },
      ),
    ),

    // Search Screen
    _PathConstants.settingScreenPath: (_) {
      return  MaterialPage(
          name: 'settings-page',
          child: SettingScreen(
            weatherPage: () { routerDelegate.pop(); },),
      );
    },

  };
}


class _PathConstants {
  const _PathConstants._();

  static String get weatherScreenPath => '/';

  static String get settingScreenPath => '${weatherScreenPath}settings';
}