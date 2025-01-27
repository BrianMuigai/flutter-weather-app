// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainTableAdapter extends TypeAdapter<MainTable> {
  @override
  final int typeId = 5;

  @override
  MainTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainTable(
      temp: fields[0] as double,
      feelsLike: fields[1] as double,
      tempMin: fields[2] as double,
      tempMax: fields[3] as double,
      pressure: fields[4] as int,
      humidity: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MainTable obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.temp)
      ..writeByte(1)
      ..write(obj.feelsLike)
      ..writeByte(2)
      ..write(obj.tempMin)
      ..writeByte(3)
      ..write(obj.tempMax)
      ..writeByte(4)
      ..write(obj.pressure)
      ..writeByte(5)
      ..write(obj.humidity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
