// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_item_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastItemTableAdapter extends TypeAdapter<ForecastItemTable> {
  @override
  final int typeId = 1;

  @override
  ForecastItemTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastItemTable(
      dt: fields[0] as int,
      dayString: fields[1] as String,
      main: fields[2] as Main,
      weather: (fields[3] as List).cast<Weather>(),
      wind: fields[4] as Wind,
      visibility: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ForecastItemTable obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.dayString)
      ..writeByte(2)
      ..write(obj.main)
      ..writeByte(3)
      ..write(obj.weather)
      ..writeByte(4)
      ..write(obj.wind)
      ..writeByte(5)
      ..write(obj.visibility);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastItemTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
