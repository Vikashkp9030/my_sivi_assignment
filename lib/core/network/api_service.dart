import 'package:dio/dio.dart';

import '../error/exceptions.dart';
import 'api_error_handler.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  late final Dio _dio;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
        baseUrl: 'https://dummyjson.com/',
      ),
    );
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    } catch (_) {
      throw UnknownException('Unexpected error occurred');
    }
  }
}
