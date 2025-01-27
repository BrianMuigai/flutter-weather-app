import 'package:hive/hive.dart';

part 'weather_table.g.dart';

@HiveType(typeId: 6)
class WeatherTable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String main;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String icon;

  WeatherTable({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  WeatherTable copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return WeatherTable(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }
}
