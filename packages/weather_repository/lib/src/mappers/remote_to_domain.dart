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
        description: description ?? '',
        country: country ?? '',
        icon: icon ?? '',
        temp: temp,
        tempMin: tempMin,
        tempMax: tempMax,
        //lastUpdated: lastUpdated ?? '',
    );
  }
}