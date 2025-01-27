import 'package:hive/hive.dart';
import 'package:weather_app/features/forecast/data/models/coordinates.dart';

part 'city_table.g.dart';

@HiveType(typeId: 0)
class CityTable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final Coordinates coord;

  @HiveField(3)
  final String country;

  CityTable({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
  });

  CityTable copyWith({
    int? id,
    String? name,
    Coordinates? coord,
    String? country,
  }) {
    return CityTable(
      id: id ?? this.id,
      name: name ?? this.name,
      coord: coord ?? this.coord,
      country: country ?? this.country,
    );
  }
}
