import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/common/exceptions.dart';
import 'package:weather_app/common/failures.dart';
import 'package:weather_app/core/api_client/models/server_error.dart';
import 'package:weather_app/features/forecast/data/datasources/forecast_remote_datasource.dart';
import 'package:weather_app/features/forecast/data/models/current_weather.dart';
import 'package:weather_app/features/forecast/data/models/forecast.dart';
import 'package:weather_app/features/forecast/domain/repositories/forecast_repository.dart';

@LazySingleton(as: ForecastRepository)
class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastRemoteDatasource _remoteDatasource;

  ForecastRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, Forecast>> getForecast(String city) async {
    try {
      final result = await _remoteDatasource.getForecast(city);
      if (result is ServerError) {
        return Left(ServerFailure(badResponse: result));
      }
      return Right(Forecast.fromJson(result));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CurrentWeather>> getCurrentWeather(String city) async {
    try {
      final result = await _remoteDatasource.getCurrentWeather(city);
      if (result is ServerError) {
        return Left(ServerFailure(badResponse: result));
      }
      return Right(CurrentWeather.fromJson(result));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
