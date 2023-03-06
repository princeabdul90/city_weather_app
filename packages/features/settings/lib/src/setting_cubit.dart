import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());

  void toggleTempUnit() {
    emit(
      state.copyWith(
        tempUnit: state.tempUnit == TempUnit.celsius
            ? TempUnit.fahrenheit
            : TempUnit.celsius,
      ),
    );
    print('tempUnit: $state');
  }
}
