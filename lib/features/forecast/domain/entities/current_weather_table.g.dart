// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentWeatherTableAdapter extends TypeAdapter<CurrentWeatherTable> {
  @override
  final int typeId = 3;

  @override
  CurrentWeatherTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentWeatherTable(
      id: fields[0] as int,
      name: fields[1] as String,
      cod: fields[2] as int,
      coord: fields[3] as Coordinates,
      weather: (fields[4] as List).cast<Weather>(),
      base: fields[5] as String,
      main: fields[6] as Main,
      visibility: fields[7] as int,
      wind: fields[8] as Wind,
      dt: fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentWeatherTable obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.cod)
      ..writeByte(3)
      ..write(obj.coord)
      ..writeByte(4)
      ..write(obj.weather)
      ..writeByte(5)
      ..write(obj.base)
      ..writeByte(6)
      ..write(obj.main)
      ..writeByte(7)
      ..write(obj.visibility)
      ..writeByte(8)
      ..write(obj.wind)
      ..writeByte(9)
      ..write(obj.dt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentWeatherTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
