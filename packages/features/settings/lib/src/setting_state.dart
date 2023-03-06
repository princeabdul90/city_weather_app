part of 'setting_cubit.dart';


class SettingState extends Equatable {
  final TempUnit tempUnit;

  const SettingState({
   this.tempUnit = TempUnit.celsius,
  });

  factory SettingState.initial() {
    return SettingState();
  }

  @override
  String toString() {
    return 'SettingState{tempUnit: $tempUnit}';
  }

  SettingState copyWith({
    TempUnit? tempUnit,
  }) {
    return SettingState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }

  @override
  List<Object> get props => [tempUnit];
}


