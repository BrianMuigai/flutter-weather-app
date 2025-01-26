part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends SettingsEvent {
  final String langCode;

  const ChangeLanguage({required this.langCode});
}

class ChangeUnitOfMeasurement extends SettingsEvent {
  final String uom;

  const ChangeUnitOfMeasurement({required this.uom});
}
