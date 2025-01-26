import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/api_client/client/dio_client.dart';
import 'package:weather_app/core/api_client/models/server_error.dart';

@lazySingleton
class ClientProvider {
  final DioClient _dioClient;

  ClientProvider(this._dioClient);

  Future<dynamic> post({String? url, Map<String, dynamic>? payload}) async {
    try {
      final response = await _dioClient.dio
          .post(url ?? '', options: _dioClient.open, data: payload);
      return response.data;
    } on DioException catch (error) {
      return ServerError.withError(error: error);
    }
  }

  Future<dynamic> put({
    String? url,
    Map<String, dynamic>? payload,
  }) async {
    try {
      final response = await _dioClient.dio
          .put(url ?? '', options: _dioClient.open, data: payload);
      return response.data;
    } on DioException catch (error) {
      return ServerError.withError(error: error);
    }
  }

  Future<dynamic> get({String? url, Map<String, dynamic>? query}) async {
    try {
      final response = await _dioClient.dio.get(
        url ?? '',
        queryParameters: query,
        options: _dioClient.open,
      );
      return response.data;
    } on DioException catch (error) {
      return ServerError.withError(error: error);
    }
  }
}
