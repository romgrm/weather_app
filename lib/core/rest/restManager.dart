import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'rest_exception.dart';

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
      Map<String, String> account = {"email": "test@test.fr", "password": "test"};

      if (mapEquals(account, body)) {
        return {"id": "1", "firstName": "John", "lastName": "Doe"};
      } else {
        return null;
      }
    } catch (e) {
      throw RestException.parseDioException(e);
    }
  }
}
