import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/common/failures.dart';
import 'package:weather_app/common/use_case.dart';
import 'package:weather_app/features/forecast/data/models/forecast.dart';
import 'package:weather_app/features/forecast/domain/repositories/forecast_repository.dart';

@lazySingleton
class GetForecastUsecase implements UseCase<Forecast, String> {
  final ForecastRepository _repo;

  GetForecastUsecase(this._repo);

  @override
  Future<Either<Failure, Forecast>> call(String city) async {
    return await _repo.getForecast(city);
  }
}
