import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tasky/core/services/secure_storage.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    _addInterceptors();
  }

  static const String baseUrl = 'https://todo.iraqsapp.com';
  void _addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          if (e.response?.statusCode == 401) {
            String? refreshToken = await SecureStorage().getRefreshToken();

            String? newAccessToken = await _refreshToken(refreshToken!);

            e.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';

            final clonedRequest = await dio.request(
              e.requestOptions.path,
              options: Options(
                method: e.requestOptions.method,
                headers: e.requestOptions.headers,
              ),
              data: e.requestOptions.data,
              queryParameters: e.requestOptions.queryParameters,
            );

            return handler.resolve(clonedRequest);
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<Map<String, dynamic>> postRequest({
    required String endPoint,
    required dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getRequest({
    required String endPoint,
    required String accessToken,
  }) async {
    final response = await dio.get(
      '$baseUrl$endPoint',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );
    return response.data;
  }

  Future<List<dynamic>> getTasks({
    required String endPoint,
    required String accessToken,
  }) async {
    final response = await dio.get(
      '$baseUrl$endPoint',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> deleteTasks({
    required String endPoint,
    required String accessToken,
    required String taskId,
  }) async {
    final response = await dio.delete(
      '$baseUrl$endPoint$taskId',
      queryParameters: {},
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> putRequest({
    required String endPoint,
    required String accessToken,
    required String taskId,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.put(
      '$baseUrl$endPoint$taskId',
      data: data,
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );
    return response.data;
  }

  Future<String?> _refreshToken(String refreshToken) async {
    try {
      final response = await dio.get(
        '$baseUrl/auth/refresh-token?token=$refreshToken',
        options: Options(
          headers: {
            'Authorization': 'Bearer $refreshToken',
          },
        ),
      );

      String? newAccessToken = response.data['access_token'];
      if (newAccessToken != null) {
        await SecureStorage().saveAccessToken(newAccessToken);
      }
      return newAccessToken;
    } catch (e) {
      log('Error refreshing token: $e');
      return null;
    }
  }
}
