// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastTableAdapter extends TypeAdapter<ForecastTable> {
  @override
  final int typeId = 4;

  @override
  ForecastTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastTable(
      cod: fields[0] as String,
      message: fields[1] as int,
      cnt: fields[2] as int,
      list: (fields[3] as List).cast<ForecastItem>(),
      city: fields[4] as City,
    );
  }

  @override
  void write(BinaryWriter writer, ForecastTable obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.cod)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.cnt)
      ..writeByte(3)
      ..write(obj.list)
      ..writeByte(4)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
