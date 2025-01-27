import 'package:hive/hive.dart';
import 'package:weather_app/features/forecast/data/models/main.dart';
import 'package:weather_app/features/forecast/data/models/weather.dart';
import 'package:weather_app/features/forecast/data/models/wind.dart';

part 'forecast_item_table.g.dart';

@HiveType(typeId: 1)
class ForecastItemTable {
  @HiveField(0)
  final int dt;

  @HiveField(1)
  final String dayString;

  @HiveField(2)
  final Main main;

  @HiveField(3)
  final List<Weather> weather;

  @HiveField(4)
  final Wind wind;

  @HiveField(5)
  final int? visibility;

  ForecastItemTable({
    required this.dt,
    required this.dayString,
    required this.main,
    required this.weather,
    required this.wind,
    required this.visibility,
  });
}
