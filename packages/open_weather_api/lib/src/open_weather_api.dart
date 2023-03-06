/*
* Developer: Abubakar Abdullahi
* Date: 28/02/2023
*/

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/models.dart';

const String kGeoCodeHost = 'https://geocoding-api.open-meteo.com/v1/search';
const kCount = '1';
const String kApiHost = 'https://api.openweathermap.org';
const gPath = '/geo/1.0/direct';
const kLimit = '1';
const wPath = '/data/2.5/weather';
const kUnit = 'metric';
const _appTokenEnvironmentVariableKey = 'open_weather_app_token';
const appToken = String.fromEnvironment(_appTokenEnvironmentVariableKey);

class OpenWeatherApi {
  OpenWeatherApi({
    @visibleForTesting Dio? dio,
  }) : _dio = dio ?? Dio() {
    _dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  final Dio _dio;

  Future<DirectGeoCodingRM> getDirectGeoCoding(String city) async {
    try {
      final response = await _dio.get(kGeoCodeHost, queryParameters: {
        'name': city,
        'count': kCount,
      });

      if (response.statusCode != 200) {
        throw StatusCodeErrorException();
      }

      final jsonObject = response.data;
      final result = jsonObject['results'][0];

      if (result == null) {
        throw EmptySearchResultException();
      }

      final directGeoCoding = DirectGeoCodingRM.fromJson(result);
      return directGeoCoding;
    } catch (e) {
      rethrow;
    }
  }

  Future<WeatherRM> getWeather(double latitude, double longitude) async {
    try {
      final response = await _dio.get('$kApiHost$wPath', queryParameters: {
        'lat': latitude,
        'lon': longitude,
        'units': kUnit,
        'appid': appToken
      });


      if (response.statusCode != 200) {
        throw StatusCodeErrorException();
      }

      final jsonObject = response.data;
      final weather = jsonObject['weather'][0];
      final main = jsonObject['main'];

      Map<String, dynamic> json = {
        'description': weather['description'],
        'icon': weather['icon'],
        'temp': main['temp'],
        'temp_min': main['temp_min'],
        'temp_max': main['temp_max'],
      };

      final weatherResult = WeatherRM.fromJson(json);
      return weatherResult;
    } catch (e) {
      rethrow;
    }
  }
}
