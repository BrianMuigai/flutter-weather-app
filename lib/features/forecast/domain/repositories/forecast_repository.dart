import 'package:dartz/dartz.dart';
import 'package:weather_app/common/failures.dart';
import 'package:weather_app/features/forecast/data/models/current_weather.dart';
import 'package:weather_app/features/forecast/data/models/forecast.dart';

abstract class ForecastRepository {
  Future<Either<Failure, Forecast>> getForecast(String city);
  Future<Either<Failure, CurrentWeather>> getCurrentWeather(String city);
}
