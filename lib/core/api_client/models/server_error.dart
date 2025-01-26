import 'package:dio/dio.dart' hide Headers;
import 'package:json_annotation/json_annotation.dart';

part 'server_error.g.dart';

@JsonSerializable()
class ServerError implements Exception {
  int? _errorCode;
  String _errorMessage = "";

  ServerError();

  ServerError.withError({required DioException error}) {
    _handleError(error);
  }

  ServerError setErrorCode(int errorCode) {
    _errorCode = errorCode;
    return this;
  }

  ServerError setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    return this;
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioExceptionType.receiveTimeout:
        _errorMessage = "Server Error. Please try again later...";
        break;
      case DioExceptionType.badResponse:
        _errorMessage = '${error.response?.data}';
        break;
      case DioExceptionType.sendTimeout:
        _errorMessage = "Please check your internet connection";
        break;
      default:
        _errorMessage = "Connection failed due to internet connection";
    }
    return _errorMessage;
  }

  Map<String, dynamic> toJson() => _$ServerErrorToJson(this);

  factory ServerError.fromJson(Map<String, dynamic> json) =>
      _$ServerErrorFromJson(json);
}
