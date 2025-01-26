import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesManager {
  final SharedPreferences _sharedPreferences;

  static String language = 'language';
  static String uom = "units of measurement";

  SharedPreferencesManager(this._sharedPreferences);

  Future<bool> putBool(String key, bool value) =>
      _sharedPreferences.setBool(key, value);

  bool? getBool(String key) => _sharedPreferences.getBool(key);

  Future<bool> putDouble(String key, double value) =>
      _sharedPreferences.setDouble(key, value);

  double? getDouble(String key) => _sharedPreferences.getDouble(key);

  Future<bool> putInt(String key, int value) =>
      _sharedPreferences.setInt(key, value);

  int? getInt(String key) => _sharedPreferences.getInt(key);

  Future<bool> putString(String key, String value) =>
      _sharedPreferences.setString(key, value);

  String? getString(String key) => _sharedPreferences.getString(key);

  Future<bool> putStringList(String key, List<String> value) =>
      _sharedPreferences.setStringList(key, value);

  List<String>? getStringList(String key) =>
      _sharedPreferences.getStringList(key);

  bool isKeyExists(String key) => _sharedPreferences.containsKey(key);

  Future<bool> clearKey(String key) => _sharedPreferences.remove(key);

  Future<bool> clearAll() => _sharedPreferences.clear();
}
