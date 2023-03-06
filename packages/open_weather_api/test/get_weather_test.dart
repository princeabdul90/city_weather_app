/*
* Developer: Abubakar Abdullahi
* Date: 05/03/2023
*/

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:open_weather_api/open_weather_api.dart';

void main() {
  test(
      'When user enter latitude and longitude, return an instance of WeatherRM',
      () async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    final remoteApi = OpenWeatherApi(dio: dio);

    dioAdapter.onGet(
      kApiHost + wPath,
      (server) => server.reply(
        200,
        {'message': 'Success!'},
        delay: const Duration(seconds: 1),
      ),
    );
    expect(await remoteApi.getWeather(37.5666791, 126.9782914), isA<WeatherRM>() );
  });
}
