import 'package:hive/hive.dart';

part 'coordinates_table.g.dart';

@HiveType(typeId: 2)
class CoordinatesTable {
  @HiveField(0)
  final double lat;

  @HiveField(1)
  final double lon;

  CoordinatesTable({
    required this.lat,
    required this.lon,
  });

  CoordinatesTable copyWith({
    double? lat,
    double? lon,
  }) {
    return CoordinatesTable(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }
}
