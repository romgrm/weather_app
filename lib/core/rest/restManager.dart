import 'package:dio/dio.dart';
import 'package:weather_app/core/rest/rest_exception.dart';

class RestManager {
  final Dio dio;

  RestManager({
    required this.dio,
  });

  Future<T> get<T>({
    required String path,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final response = await dio.get(path, queryParameters: parameters);
      return response.data;
    } catch (e) {
      throw RestException.parseDioException(e);
    }
  }

  Future post({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final response = await dio.post(path, data: body, queryParameters: parameters);
      return response.data;
    } catch (e) {
      throw RestException.parseDioException(e);
    }
  }
}
