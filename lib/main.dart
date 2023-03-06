import 'package:flutter/material.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:routemaster/routemaster.dart';
import 'package:weather_app/routing_table.dart';
import 'package:weather_repository/weather_repository.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  // This widget is the root of your application.
  late final _openWeatherApi = OpenWeatherApi();
  late final _weatherRepository =
      WeatherRepository(openWeatherApi: _openWeatherApi);

  late final dynamic _routerDelegate = RoutemasterDelegate(
      routesBuilder: (context) {
        return RouteMap(
            routes: buildRoutingTable(
                routerDelegate: _routerDelegate,
                weatherRepository: _weatherRepository)
        );
      },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
     routerDelegate: _routerDelegate,
     routeInformationParser: const RoutemasterParser(),

    );
  }
}
