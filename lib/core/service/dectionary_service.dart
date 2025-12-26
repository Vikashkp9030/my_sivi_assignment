import 'package:dio/dio.dart';

class DictionaryService {
  DictionaryService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.dictionaryapi.dev/api/v2/entries/en',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  static final DictionaryService _instance = DictionaryService._internal();

  factory DictionaryService() => _instance;

  late final Dio _dio;

  Future<String> fetchMeaning(String word) async {
    try {
      final response = await _dio.get('/$word');

      final data = response.data;

      return data[0]['meanings'][0]['definitions'][0]['definition'];
    } on DioException catch (e) {
      throw Exception(e.response?.data?['message'] ?? 'Meaning not found');
    } catch (_) {
      throw Exception('Something went wrong');
    }
  }
}
