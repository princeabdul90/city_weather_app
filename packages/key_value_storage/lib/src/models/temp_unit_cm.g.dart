// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_unit_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TempUnitCMAdapter extends TypeAdapter<TempUnitCM> {
  @override
  final int typeId = 1;

  @override
  TempUnitCM read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TempUnitCM.celsius;
      case 1:
        return TempUnitCM.fahrenheit;
      default:
        return TempUnitCM.celsius;
    }
  }

  @override
  void write(BinaryWriter writer, TempUnitCM obj) {
    switch (obj) {
      case TempUnitCM.celsius:
        writer.writeByte(0);
        break;
      case TempUnitCM.fahrenheit:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TempUnitCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
