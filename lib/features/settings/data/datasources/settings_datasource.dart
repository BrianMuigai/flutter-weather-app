import 'package:injectable/injectable.dart';
import 'package:weather_app/core/storage/shared_preferences_manager.dart';

@lazySingleton
class SettingsDatasource {
  final SharedPreferencesManager _preferencesManager;

  SettingsDatasource(this._preferencesManager);

  Future<void> changeLanguage(String code) async {
    await _preferencesManager.putString(
        SharedPreferencesManager.language, code);
  }

  Future<void> changeUOM(String uom) async {
    await _preferencesManager.putString(SharedPreferencesManager.uom, uom);
  }
}
