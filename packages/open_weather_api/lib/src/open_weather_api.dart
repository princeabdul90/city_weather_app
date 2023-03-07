/*
* Developer: Abubakar Abdullahi
* Date: 28/02/2023
*/

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_api/src/url_builder.dart';

import 'models/models.dart';


class OpenWeatherApi {
  OpenWeatherApi({
    @visibleForTesting Dio? dio,
    @visibleForTesting UrlBuilder? urlBuilder,
  }) : _dio = dio ?? Dio(),
    _urlBuilder = urlBuilder ?? const UrlBuilder() {
    _dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  final Dio _dio;
  final UrlBuilder _urlBuilder;

  Future<DirectGeoCodingRM> getDirectGeoCoding(String city) async {

    final url = _urlBuilder.buildDirectGeoCodingPath(city);
    try {
      final response = await _dio.get(url);

      if (response.statusCode != 200) {
        throw StatusCodeErrorException();
      }

      final jsonObject = response.data;

      if (jsonObject == null) {
        throw EmptySearchResultException();
      }

      final directGeoCoding = DirectGeoCodingRM.fromJson(jsonObject);
      return directGeoCoding;
    } catch (e) {
      rethrow;
    }
  }

  Future<WeatherRM> getWeather(double latitude, double longitude) async {
    final url = _urlBuilder.buildWeatherPath(longitude, latitude);
    try {
      final response = await _dio.get(url);

      if (response.statusCode != 200) {
        throw StatusCodeErrorException();
      }

      final jsonObject = response.data;

      final weatherResult = WeatherRM.fromJson(jsonObject);
      return weatherResult;
    } catch (e) {
      rethrow;
    }
  }
}
