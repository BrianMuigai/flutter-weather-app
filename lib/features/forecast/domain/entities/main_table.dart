import 'package:hive/hive.dart';

part 'main_table.g.dart';

@HiveType(typeId: 5)
class MainTable {
  @HiveField(0)
  final double temp;

  @HiveField(1)
  final double feelsLike;

  @HiveField(2)
  final double tempMin;

  @HiveField(3)
  final double tempMax;

  @HiveField(4)
  final int pressure;

  @HiveField(5)
  final int humidity;

  MainTable({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  MainTable copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
  }) {
    return MainTable(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
    );
  }
}
