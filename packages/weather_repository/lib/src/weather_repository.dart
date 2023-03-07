/*
* Developer: Abubakar Abdullahi
* Date: 01/03/2023
*/

import 'package:domain_models/domain_models.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_repository/src/mappers/remote_to_domain.dart';

class WeatherRepository {
  final OpenWeatherApi openWeatherApi;

  const WeatherRepository({
    required this.openWeatherApi,
  });

  Future<Weather> getWeather(String city) async {
    try {
      final directGeoCoding = await openWeatherApi.getDirectGeoCoding(city);
      final weatherTemp = await openWeatherApi.getWeather(directGeoCoding.lat, directGeoCoding.lon);

      final weather = weatherTemp.copyWith(
        name: directGeoCoding.name,
        country: directGeoCoding.country,
      );
      final domainWeather = weather.toDomainModel();
      return domainWeather;
    } on EmptySearchResultException catch (e) {
      throw EmptySearchResultException();
    }
  }
}
