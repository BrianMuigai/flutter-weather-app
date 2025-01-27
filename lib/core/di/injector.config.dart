// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/forecast/data/datasources/forecast_local_datasource.dart'
    as _i102;
import '../../features/forecast/data/datasources/forecast_remote_datasource.dart'
    as _i936;
import '../../features/forecast/data/repositories/forecast_repository_impl.dart'
    as _i1067;
import '../../features/forecast/domain/repositories/forecast_repository.dart'
    as _i1011;
import '../../features/forecast/domain/usecases/get_current_weather_usecase.dart'
    as _i11;
import '../../features/forecast/domain/usecases/get_forecast_usecase.dart'
    as _i456;
import '../../features/forecast/presentation/bloc/forecast_bloc.dart' as _i932;
import '../../features/settings/data/datasources/settings_datasource.dart'
    as _i283;
import '../../features/settings/data/repositories/settings_repository_impl.dart'
    as _i955;
import '../../features/settings/domain/repositories/settings_repository.dart'
    as _i674;
import '../../features/settings/domain/usecases/change_language_usecase.dart'
    as _i953;
import '../../features/settings/domain/usecases/change_uom_usecase.dart'
    as _i68;
import '../../features/settings/presentation/bloc/settings_bloc.dart' as _i585;
import '../api_client/client/dio_client.dart' as _i758;
import '../api_client/client_provider.dart' as _i546;
import '../storage/shared_preferences_manager.dart' as _i203;
import 'module_injector.dart' as _i759;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModules.prefs(),
      preResolve: true,
    );
    gh.factory<String>(
      () => registerModules.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<String>(
      () => registerModules.apiKey,
      instanceName: 'ApiKey',
    );
    gh.lazySingleton<_i203.SharedPreferencesManager>(
        () => _i203.SharedPreferencesManager(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i102.ForecastLocalDataSource>(() =>
        _i102.ForecastLocalDataSource(gh<_i203.SharedPreferencesManager>()));
    gh.lazySingleton<_i283.SettingsDatasource>(
        () => _i283.SettingsDatasource(gh<_i203.SharedPreferencesManager>()));
    gh.lazySingleton<_i361.Dio>(
        () => registerModules.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.lazySingleton<_i674.SettingsRepository>(
        () => _i955.SettingsRepositoryImpl(gh<_i283.SettingsDatasource>()));
    gh.lazySingleton<_i758.DioClient>(() => _i758.DioClient(
          gh<_i361.Dio>(),
          gh<_i203.SharedPreferencesManager>(),
          gh<String>(instanceName: 'ApiKey'),
        ));
    gh.lazySingleton<_i546.ClientProvider>(
        () => _i546.ClientProvider(gh<_i758.DioClient>()));
    gh.lazySingleton<_i953.ChangeLanguageUsecase>(
        () => _i953.ChangeLanguageUsecase(gh<_i674.SettingsRepository>()));
    gh.lazySingleton<_i68.ChangeUomUsecase>(
        () => _i68.ChangeUomUsecase(gh<_i674.SettingsRepository>()));
    gh.lazySingleton<_i936.ForecastRemoteDatasource>(
        () => _i936.ForecastRemoteDatasource(gh<_i546.ClientProvider>()));
    gh.factory<_i585.SettingsBloc>(() => _i585.SettingsBloc(
          gh<_i203.SharedPreferencesManager>(),
          gh<_i953.ChangeLanguageUsecase>(),
          gh<_i68.ChangeUomUsecase>(),
        ));
    gh.lazySingleton<_i1011.ForecastRepository>(
        () => _i1067.ForecastRepositoryImpl(
              gh<_i936.ForecastRemoteDatasource>(),
              gh<_i102.ForecastLocalDataSource>(),
            ));
    gh.lazySingleton<_i456.GetForecastUsecase>(
        () => _i456.GetForecastUsecase(gh<_i1011.ForecastRepository>()));
    gh.lazySingleton<_i11.GetCurrentWeatherUsecase>(
        () => _i11.GetCurrentWeatherUsecase(gh<_i1011.ForecastRepository>()));
    gh.factory<_i932.ForecastBloc>(() => _i932.ForecastBloc(
          gh<_i456.GetForecastUsecase>(),
          gh<_i11.GetCurrentWeatherUsecase>(),
          gh<_i203.SharedPreferencesManager>(),
        ));
    return this;
  }
}

class _$RegisterModules extends _i759.RegisterModules {}
