// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoordinatesTableAdapter extends TypeAdapter<CoordinatesTable> {
  @override
  final int typeId = 2;

  @override
  CoordinatesTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoordinatesTable(
      lat: fields[0] as double,
      lon: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CoordinatesTable obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordinatesTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
