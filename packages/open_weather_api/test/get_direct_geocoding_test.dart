/*
* Developer: Abubakar Abdullahi
* Date: 05/03/2023
*/

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:open_weather_api/open_weather_api.dart';

void main() {
  test('When user enters city name, return an instance of DirectGeoCodingRM',
      () async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    final remoteApi = OpenWeatherApi(dio: dio);

    dioAdapter.onGet(
      kGeoCodeHost,

      (server) => server.reply(
        200,
        {'message': 'Success!'},
        delay: const Duration(seconds: 1),
      ),
    );
    expect(await remoteApi.getDirectGeoCoding('london'), isA<DirectGeoCodingRM>());
  });
}
