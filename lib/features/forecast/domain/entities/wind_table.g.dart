// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WindTableAdapter extends TypeAdapter<WindTable> {
  @override
  final int typeId = 7;

  @override
  WindTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WindTable(
      speed: fields[0] as double,
      deg: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WindTable obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.speed)
      ..writeByte(1)
      ..write(obj.deg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WindTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
