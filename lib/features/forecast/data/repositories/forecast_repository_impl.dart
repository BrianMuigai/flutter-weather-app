import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/common/exceptions.dart';
import 'package:weather_app/common/failures.dart';
import 'package:weather_app/core/api_client/models/server_error.dart';
import 'package:weather_app/features/forecast/data/datasources/forecast_remote_datasource.dart';
import 'package:weather_app/features/forecast/data/datasources/forecast_local_datasource.dart';
import 'package:weather_app/features/forecast/data/models/current_weather.dart';
import 'package:weather_app/features/forecast/data/models/forecast.dart';
import 'package:weather_app/features/forecast/domain/repositories/forecast_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

@LazySingleton(as: ForecastRepository)
class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastRemoteDatasource _remoteDatasource;
  final ForecastLocalDataSource _localDatasource;

  ForecastRepositoryImpl(this._remoteDatasource, this._localDatasource);

  Future<bool> _checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  @override
  Future<Either<Failure, Forecast>> getForecast(String city) async {
    if (!await _checkConnectivity()) {
      // Fetch data from local data source if no internet connection
      final localResult = await _localDatasource.retrieveForecast();
      if (localResult != null) {
        return Right(localResult);
      } else {
        return Left(CacheFailure());
      }
    }
    try {
      final result = await _remoteDatasource.getForecast(city);
      if (result is ServerError) {
        return Left(ServerFailure(badResponse: result));
      }
      final Forecast forecast = Forecast.fromJson(result);
      // Update local storage with the fetched data
      await _localDatasource.storeForecast(forecast);
      return Right(forecast);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CurrentWeather>> getCurrentWeather(String city) async {
    if (!await _checkConnectivity()) {
      // Fetch data from local data source if no internet connection
      final localResult = await _localDatasource.retrieveCurrentWeather();
      if (localResult != null) {
        return Right(localResult);
      } else {
        return Left(CacheFailure());
      }
    }
    try {
      final result = await _remoteDatasource.getCurrentWeather(city);
      if (result is ServerError) {
        return Left(ServerFailure(badResponse: result));
      }
      final currentWeather = CurrentWeather.fromJson(result);
      // Update local storage with the fetched data
      await _localDatasource.storeCurrentWeather(currentWeather);
      await _localDatasource.storeLastUpdated();
      return Right(currentWeather);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
