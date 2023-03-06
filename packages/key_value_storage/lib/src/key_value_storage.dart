/*
* Developer: Abubakar Abdullahi
* Date: 04/03/2023
*/

import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:key_value_storage/key_value_storage.dart';

class KeyValueStorage {
  static const _weatherBoxKey = 'weather';
  static const _tempUnitBoxKey = 'temp-unit';

  KeyValueStorage({
    @visibleForTesting HiveInterface? hive,
  }) : _hive = hive ?? Hive {
    try {
      _hive
        ..registerAdapter(WeatherCMAdapter())
        ..registerAdapter(TempUnitCMAdapter());
    } catch (_) {
      throw Exception(
          'You shouldn\'t have more than one [KeyValueStorage] instance in your project');
    }
  }

  final HiveInterface _hive;

  Future<Box<WeatherCM>> get weatherBox => _openHiveBox<WeatherCM>(
        _weatherBoxKey,
        isTemporary: false,
      );

  Future<Box<TempUnitCM>> get tempUnitBox => _openHiveBox<TempUnitCM>(
        _tempUnitBoxKey,
        isTemporary: false,
      );

  Future<Box<T>> _openHiveBox<T>(String boxKey,
      {required bool isTemporary}) async {
    if (_hive.isBoxOpen(boxKey)) {
      return _hive.box(boxKey);
    } else {
      final directory = await (isTemporary
          ? getTemporaryDirectory()
          : getApplicationDocumentsDirectory());

      return _hive.openBox<T>(
        boxKey,
        path: directory.path,
      );
    }
  }
}
