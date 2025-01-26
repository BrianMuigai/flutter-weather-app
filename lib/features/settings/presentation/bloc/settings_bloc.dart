import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/storage/shared_preferences_manager.dart';
import 'package:weather_app/features/settings/domain/usecases/change_language_usecase.dart';
import 'package:weather_app/features/settings/domain/usecases/change_uom_usecase.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferencesManager _preferencesManager;
  final ChangeLanguageUsecase _changeLanguageUsecase;
  final ChangeUomUsecase _changeUOMUsecase;

  SettingsBloc(this._preferencesManager, this._changeLanguageUsecase,
      this._changeUOMUsecase)
      : super(SettingsInitial()) {
    on<ChangeLanguage>(_changeLanguage);
    on<ChangeUnitOfMeasurement>(_changeUnitOfMeasurement);
  }

  FutureOr<void> _changeLanguage(
      ChangeLanguage event, Emitter<SettingsState> emit) async {
    emit(ChangeLanguageLoading());
    final response = await _changeLanguageUsecase.call(event.langCode);
    emit(response.fold(
      (err) =>
          ChangeLanguageError(error: err.toString(), langCode: event.langCode),
      (_) => ChangeLanguageSuccess(langCode: event.langCode),
    ));
  }

  FutureOr<void> _changeUnitOfMeasurement(
      ChangeUnitOfMeasurement event, Emitter<SettingsState> emit) async {
    emit(ChangeUOMLoading());
    final response = await _changeUOMUsecase.call(event.uom);
    emit(response.fold(
      (err) => ChangeUnitOfMeasurementError(error: err.toString()),
      (_) => ChangeUnitOfMeasurementSuccess(),
    ));
  }

  String getMetrics() {
    return _preferencesManager.getString(SharedPreferencesManager.uom) ??
        'standard';
  }
}
