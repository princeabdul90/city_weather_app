part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, success, error }

class WeatherState extends Equatable {
  final WeatherStatus status;
  final Weather weather;
  final String error;
  final TempUnit tempUnit;

  const WeatherState({
    required this.status,
    required this.weather,
    required this.error,
    required this.tempUnit
  });

  factory WeatherState.initial(){
    return WeatherState(
      weather: Weather.initial(),
      status: WeatherStatus.initial,
      error: '',
      tempUnit: TempUnit.celsius,
    );
  }

  @override
  String toString() {
    return 'WeatherState{status: $status, weather: $weather, error: $error, tempUnit: $tempUnit}';
  }

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    String? error,
    TempUnit? tempUnit,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      error: error ?? this.error,
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }

  @override
  List<Object> get props => [status, weather, error, tempUnit];
}

