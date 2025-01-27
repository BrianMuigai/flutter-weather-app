import 'package:hive/hive.dart';
import 'package:weather_app/features/forecast/data/models/coordinates.dart';
import 'package:weather_app/features/forecast/data/models/main.dart';
import 'package:weather_app/features/forecast/data/models/weather.dart';
import 'package:weather_app/features/forecast/data/models/wind.dart';
import 'package:weather_app/features/forecast/data/models/current_weather.dart'; // Ensure this is imported

part 'current_weather_table.g.dart';

@HiveType(typeId: 3)
class CurrentWeatherTable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int cod;

  @HiveField(3)
  final Coordinates coord;

  @HiveField(4)
  final List<Weather> weather;

  @HiveField(5)
  final String base;

  @HiveField(6)
  final Main main;

  @HiveField(7)
  final int visibility;

  @HiveField(8)
  final Wind wind;

  @HiveField(9)
  final double dt;

  CurrentWeatherTable({
    required this.id,
    required this.name,
    required this.cod,
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.dt,
  });

  factory CurrentWeatherTable.fromModel(CurrentWeather currentWeather) {
    return CurrentWeatherTable(
      id: currentWeather.id,
      name: currentWeather.name,
      cod: currentWeather.cod,
      coord: currentWeather.coord,
      weather: currentWeather.weather,
      base: currentWeather.base,
      main: currentWeather.main,
      visibility: currentWeather.visibility,
      wind: currentWeather.wind,
      dt: currentWeather.dt,
    );
  }
}
