/*
* Developer: Abubakar Abdullahi
* Date: 02/03/2023
*/

import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/setting_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key, required this.weatherPage}) : super(key: key);
  final VoidCallback weatherPage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingCubit>(
      create: (context) => SettingCubit(),
      child:  SettingView(weatherPage: weatherPage,),
    );
  }
}

class SettingView extends StatelessWidget {
  const SettingView({Key? key, required this.weatherPage}) : super(key: key);

  final VoidCallback weatherPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: ListTile(
            title: const Text('Temperature Unit'),
            subtitle: const Text('Celsius/Fahrenheit (Default: Celsius)'),
            trailing: Switch(
              value: context.watch<SettingCubit>().state.tempUnit == TempUnit.celsius,
              onChanged: (_) {
                context.read<SettingCubit>().toggleTempUnit();
                weatherPage();
              },
            ),
          ),
        )
    );
  }
}
