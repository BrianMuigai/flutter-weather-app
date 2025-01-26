import 'package:dartz/dartz.dart';
import 'package:weather_app/common/failures.dart';
import 'package:weather_app/common/use_case.dart';

abstract class SettingsRepository {
  Future<Either<Failure, NoParams>> changeLanguage(String lang);
  Future<Either<Failure, NoParams>> changeUOM(String uom);
}
