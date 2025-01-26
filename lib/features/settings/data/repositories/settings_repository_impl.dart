import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/common/failures.dart';
import 'package:weather_app/common/use_case.dart';
import 'package:weather_app/features/settings/data/datasources/settings_datasource.dart';
import 'package:weather_app/features/settings/domain/repositories/settings_repository.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDatasource _datasource;

  SettingsRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, NoParams>> changeLanguage(String lang) async {
    await _datasource.changeLanguage(lang);
    return Right(NoParams());
  }

  @override
  Future<Either<Failure, NoParams>> changeUOM(String uom) async {
    await _datasource.changeUOM(uom);
    return Right(NoParams());
  }
}
