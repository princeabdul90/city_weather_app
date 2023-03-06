
import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.weatherRepository}) : super(WeatherState.initial());

  final WeatherRepository weatherRepository;

  Future<void> fetchWeather(String city) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final Weather weather = await weatherRepository.getWeather(city);
      emit(state.copyWith(status: WeatherStatus.success, weather: weather));
      print('state: $state');

    }catch (e) {
      emit(state.copyWith(status: WeatherStatus.error, error: e.toString()));
      print('state: $state');
    }
  }

  void setTempUnit(TempUnit tempUnit) {
    if(tempUnit == TempUnit.celsius){
      emit(state.copyWith(tempUnit: TempUnit.celsius));
    }else{
      emit(state.copyWith(tempUnit: TempUnit.fahrenheit));
    }
  }
}
