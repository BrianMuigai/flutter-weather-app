part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class ChangeLanguageLoading extends SettingsState {}

class ChangeLanguageSuccess extends SettingsState {
  final String langCode;

  const ChangeLanguageSuccess({required this.langCode});
}

class ChangeLanguageError extends SettingsState {
  final String error;
  final String langCode;

  const ChangeLanguageError({required this.error, required this.langCode});
}

class ChangeUnitOfMeasurementSuccess extends SettingsState {}

class ChangeUnitOfMeasurementError extends SettingsState {
  final String error;

  const ChangeUnitOfMeasurementError({required this.error});
}
