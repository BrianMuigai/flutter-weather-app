import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/forecast/data/models/main.dart';
import 'package:weather_app/features/forecast/data/models/weather.dart';
import 'package:weather_app/features/forecast/data/models/wind.dart';

part 'forecast_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ForecastItem {
  final int dt;
  @JsonKey(name: 'dt_txt')
  final String dayString;
  final Main main;
  final List<Weather> weather;
  final Wind wind;
  final int? visibility;

  ForecastItem(
      {required this.dt,
      required this.dayString,
      required this.main,
      required this.weather,
      required this.wind,
      required this.visibility});

  factory ForecastItem.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastItemToJson(this);
}
