/*
* Developer: Abubakar Abdullahi
* Date: 01/03/2023
*/

import 'dart:io';

import 'package:domain_models/domain_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/weather_cubit.dart';
import 'package:weather_repository/weather_repository.dart';

const String kIconHost = 'openweathermap.org';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({
    Key? key,
    required this.weatherRepository,
    required this.onTappedSetting,
  }) : super(key: key);

  final WeatherRepository weatherRepository;
  final VoidCallback onTappedSetting;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(
        weatherRepository: weatherRepository,
      ),
      child: WeatherView(
        onTappedSetting: onTappedSetting,
      ),
    );
  }
}

@visibleForTesting
class WeatherView extends StatelessWidget {
  const WeatherView({Key? key, required this.onTappedSetting})
      : super(key: key);

  final VoidCallback onTappedSetting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                 onTappedSetting();
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SearchWeather(),
            SizedBox(height: 20),
            WeatherDisplay(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '©2023. Built with 💜💜 by Abdul',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchWeather extends StatefulWidget {
  const SearchWeather({Key? key}) : super(key: key);

  @override
  State<SearchWeather> createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<SearchWeather> {
  TextEditingController cityController = TextEditingController();

  String? errortext;

  void onSearchCity() {
    context.read<WeatherCubit>().fetchWeather(cityController.text);
    cityController.clear();
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: SizedBox(
        height: 45,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: cityController,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: const InputDecoration(
                  labelText: 'City Name',
                  hintText: 'enters more than 2 characters',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            MaterialButton(
              onPressed: () {
                onSearchCity();
              },
              height: 40,
              color: Colors.indigo,
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WeatherDisplay extends StatelessWidget {
  const WeatherDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(


      listener: (context, state) {
        if (state.status == WeatherStatus.error) {
          const errorMsg = 'Some went wrong!';
          errorDialog(context, errorMsg);
        }

      },
      builder: (context, state) {
        if (state.status == WeatherStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }



        return Expanded(
          child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              //reverse: true,
              child: Container(
                height: 500,
                color: Colors.indigo.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          state.weather.name,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(state.weather.country),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          showTemperature(state.weather.temp),
                          style: const TextStyle(
                              fontSize: 55, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            Text(
                                showTemperature( state.weather.tempMax),
                                style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 5),
                            Text(
                                showTemperature(state.weather.tempMin),
                                style: const TextStyle(fontSize: 16)),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Spacer(),
                        showIcon(state.weather.icon),
                        // SizedBox(width: 10),
                        Text(
                          state.weather.description,
                          style: const TextStyle(
                            fontSize: 24,
                            //fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                      ],
                    )
                  ],
                ),
              )),
        );
      },
    );
  }

  String showTemperature(double temp) {

    // if (TempUnit.fahrenheit) {
    //   return '${((temp * 9 / 5) + 32).toStringAsFixed(2)}℉';
    // }
    return '${temp.toStringAsFixed(2)}℃';
  }

  Widget showIcon(String icon) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/loading.gif',
      image: 'http://$kIconHost/img/wn/$icon@4x.png',
      width: 96,
      height: 96,
    );
  }

  Widget formatText(String description) {
    final formattedString = description;
    return Text(
      formattedString,
      style: const TextStyle(
        fontSize: 24,
        //fontWeight: FontWeight.bold
      ),
      textAlign: TextAlign.center,
    );
  }

  void errorDialog(BuildContext context, String errorMsg) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Error'),
            content: Text(errorMsg),
            actions: [
              CupertinoDialogAction(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'))
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(errorMsg),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'))
          ],
        ),
      );
    }
  }
}
