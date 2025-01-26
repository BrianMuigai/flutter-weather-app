import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModules {
  @preResolve
  Future<SharedPreferences> prefs() async =>
      await SharedPreferences.getInstance();

  @Named('BaseUrl')
  String get baseUrl => dotenv.env['BASE_URL']!;

  @Named('ApiKey')
  String get apiKey => dotenv.env['API_KEY']!;

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(
      BaseOptions(baseUrl: url, connectTimeout: const Duration(seconds: 10)));
}
