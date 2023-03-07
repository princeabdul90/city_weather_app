/*
* Developer: Abubakar Abdullahi
* Date: 07/03/2023
*/

const _appTokenEnvironmentVariableKey = 'open_weather_app_token';
const appToken = String.fromEnvironment(_appTokenEnvironmentVariableKey);

class UrlBuilder {

  final String _baseUrl;

  const UrlBuilder({
     String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://api.openweathermap.org';


  String buildDirectGeoCodingPath(String city) {
    const gPath = '/geo/1.0/direct';
    const kLimit = '1';

    return '$_baseUrl$gPath?q=$city&limit=$kLimit&appid=$appToken';
  }

  String buildWeatherPath(double lon, double lat) {
    const wPath = '/data/2.5/weather';
    const kUnit = 'metric';

    return '$_baseUrl$wPath?lat=$lat&lon=$lon&units=$kUnit&appid=$appToken';
  }
}