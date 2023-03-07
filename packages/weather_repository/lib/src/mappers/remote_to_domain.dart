/*
* Developer: Abubakar Abdullahi
* Date: 01/03/2023
*/

import 'package:domain_models/domain_models.dart';
import 'package:open_weather_api/open_weather_api.dart';

extension WeatherRMtoDomain on WeatherRM {
  Weather toDomainModel() {
    return Weather(
        name: name ?? '',
        country: country ?? '',
        description: weather![0]['description'] as String,
        icon: weather![0]['icon'] as String,
        temp: main!['temp'] as double,
        tempMin: main!['temp_min'] as double,
        tempMax: main!['temp_max'] as double,
    );
  }
}