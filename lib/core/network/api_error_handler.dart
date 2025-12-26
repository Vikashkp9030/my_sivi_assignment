import 'package:dio/dio.dart';

import '../error/exceptions.dart';

class ApiErrorHandler {
  static Exception handle(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return NetworkException('Connection timeout');
    }

    if (e.type == DioExceptionType.badResponse) {
      final statusCode = e.response?.statusCode ?? 0;
      final message = e.response?.data['message'] ?? 'Server error';
      return ServerException('[$statusCode] $message');
    }

    if (e.type == DioExceptionType.connectionError) {
      return NetworkException('No internet connection');
    }

    return UnknownException('Something went wrong');
  }
}
