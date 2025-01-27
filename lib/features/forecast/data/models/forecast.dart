import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/forecast/data/models/forecast_item.dart';
import 'package:weather_app/features/forecast/data/models/city.dart';
import 'package:weather_app/features/forecast/domain/entities/forecast_table.dart'; // Ensure this is imported

part 'forecast.g.dart';

@JsonSerializable(explicitToJson: true)
class Forecast {
  final String cod;
  final int message;
  final int cnt;
  final List<ForecastItem> list;
  final City city;

  Forecast({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);

  // New method to create Forecast from ForecastTable
  factory Forecast.fromTable(ForecastTable table) {
    return Forecast(
      cod: table.cod,
      message: table.message,
      cnt: table.cnt,
      list: table.list, // Assuming list is already in the correct format
      city: table.city, // Assuming city is already in the correct format
    );
  }
}
