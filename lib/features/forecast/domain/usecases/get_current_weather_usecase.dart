import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/common/failures.dart';
import 'package:weather_app/common/use_case.dart';
import 'package:weather_app/features/forecast/data/models/current_weather.dart';
import 'package:weather_app/features/forecast/domain/repositories/forecast_repository.dart';

@lazySingleton
class GetCurrentWeatherUsecase implements UseCase<CurrentWeather, String> {
  final ForecastRepository _repo;

  GetCurrentWeatherUsecase(this._repo);

  @override
  Future<Either<Failure, CurrentWeather>> call(String params) async {
    return await _repo.getCurrentWeather(params);
  }
}
