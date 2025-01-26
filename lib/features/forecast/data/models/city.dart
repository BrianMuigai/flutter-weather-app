import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/forecast/data/models/coordinates.dart';

part 'city.g.dart';

@JsonSerializable(explicitToJson: true)
class City {
  final int id;
  final String name;
  final Coordinates coord;
  final String country;

  City(
      {required this.id,
      required this.name,
      required this.coord,
      required this.country});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
