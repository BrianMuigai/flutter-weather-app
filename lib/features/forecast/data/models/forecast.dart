import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/forecast/data/models/city.dart';
import 'package:weather_app/features/forecast/data/models/forecast_item.dart';

part 'forecast.g.dart';

@JsonSerializable(explicitToJson: true)
class Forecast {
  final String cod;
  final int message;
  final int cnt;
  final List<ForecastItem> list;
  final City city;

  Forecast(
      {required this.cod,
      required this.message,
      required this.cnt,
      required this.list,
      required this.city});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
