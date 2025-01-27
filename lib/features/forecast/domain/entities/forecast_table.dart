import 'package:hive/hive.dart';
import 'package:weather_app/features/forecast/data/models/city.dart';
import 'package:weather_app/features/forecast/data/models/forecast.dart';
import 'package:weather_app/features/forecast/data/models/forecast_item.dart';

part 'forecast_table.g.dart';

@HiveType(typeId: 4)
class ForecastTable {
  @HiveField(0)
  final String cod;

  @HiveField(1)
  final int message;

  @HiveField(2)
  final int cnt;

  @HiveField(3)
  final List<ForecastItem> list;

  @HiveField(4)
  final City city;

  ForecastTable({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory ForecastTable.fromModel(Forecast forecast) {
    return ForecastTable(
      cod: forecast.cod,
      message: forecast.message,
      cnt: forecast.cnt,
      list: forecast.list, // Assuming list is already in the correct format
      city: forecast.city, // Assuming city is already in the correct format
    );
  }
}
