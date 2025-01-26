import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/common/failures.dart';
import 'package:weather_app/common/use_case.dart';
import 'package:weather_app/features/settings/domain/repositories/settings_repository.dart';

@lazySingleton
class ChangeLanguageUsecase extends UseCase<NoParams, String> {
  final SettingsRepository _repository;

  ChangeLanguageUsecase(this._repository);

  @override
  Future<Either<Failure, NoParams?>> call(String params) async {
    return await _repository.changeLanguage(params);
  }
}
