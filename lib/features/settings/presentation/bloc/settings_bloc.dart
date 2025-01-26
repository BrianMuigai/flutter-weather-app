import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/storage/shared_preferences_manager.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferencesManager _preferencesManager;
  SettingsBloc(this._preferencesManager) : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  String getMetrics() {
    return _preferencesManager.getString(SharedPreferencesManager.uom) ??
        'standard';
  }
}
