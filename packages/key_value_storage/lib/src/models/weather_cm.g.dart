// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherCMAdapter extends TypeAdapter<WeatherCM> {
  @override
  final int typeId = 0;

  @override
  WeatherCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherCM(
      name: fields[0] as String,
      description: fields[1] as String,
      country: fields[2] as String,
      icon: fields[3] as String,
      temp: fields[4] as double,
      tempMin: fields[5] as double,
      tempMax: fields[6] as double,
      lastUpdated: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherCM obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.temp)
      ..writeByte(5)
      ..write(obj.tempMin)
      ..writeByte(6)
      ..write(obj.tempMax)
      ..writeByte(7)
      ..write(obj.lastUpdated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
