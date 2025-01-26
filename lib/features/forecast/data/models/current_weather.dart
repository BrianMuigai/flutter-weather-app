import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/forecast/data/models/coordinates.dart';
import 'package:weather_app/features/forecast/data/models/main.dart';
import 'package:weather_app/features/forecast/data/models/weather.dart';
import 'package:weather_app/features/forecast/data/models/wind.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather {
  final int id;
  final String name;
  final int cod;
  final Coordinates coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final double dt;

  CurrentWeather(
      {required this.id,
      required this.name,
      required this.cod,
      required this.coord,
      required this.weather,
      required this.base,
      required this.main,
      required this.visibility,
      required this.wind,
      required this.dt});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}
