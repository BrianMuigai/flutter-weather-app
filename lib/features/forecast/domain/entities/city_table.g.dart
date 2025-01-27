// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityTableAdapter extends TypeAdapter<CityTable> {
  @override
  final int typeId = 0;

  @override
  CityTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityTable(
      id: fields[0] as int,
      name: fields[1] as String,
      coord: fields[2] as Coordinates,
      country: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CityTable obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.coord)
      ..writeByte(3)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
