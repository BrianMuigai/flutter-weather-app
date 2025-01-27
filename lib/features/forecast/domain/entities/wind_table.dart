import 'package:hive/hive.dart';

part 'wind_table.g.dart';

@HiveType(typeId: 7)
class WindTable {
  @HiveField(0)
  final double speed;

  @HiveField(1)
  final int deg;

  WindTable({
    required this.speed,
    required this.deg,
  });

  WindTable copyWith({
    double? speed,
    int? deg,
  }) {
    return WindTable(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
    );
  }
}
